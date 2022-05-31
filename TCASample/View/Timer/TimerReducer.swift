//
//  TimerReducer.swift
//  TCASample
//
//  Created by ello on 2022/5/30.
//

import ComposableArchitecture
import Foundation

private struct TimerId: Hashable {
}

let timerReducer = Reducer<TimerState, TimerAction, TimerEnvironment> { state, action, environment in
    switch action {
    case .start:
        if state.started == nil {
            state.started = environment.date()
        }
        state.duration = 0
        return Effect.timer(
            id: TimerId(),
            every: .milliseconds(1000),
            tolerance: .zero,
            on: environment.queue
        ).map { _ in
            TimerAction.update
        }
    case .end:
        return .cancel(id: TimerId())
    case .update:
        state.duration += 1
        return .none

    case .load:
        return environment.request?()
            .receive(on: environment.queue)
            .catchToEffect(TimerAction.loaded) ?? .none
    case let .loaded(result):
        do {
            state.html = try result.get()
        }catch {
            state.html = "Error:\(error)"
        }
        
        return .none
    }
}
