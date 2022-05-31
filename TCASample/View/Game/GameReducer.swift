//
//  GameReducer.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import ComposableArchitecture
import Foundation

let gameReducer = Reducer<GameState, GameAction, GameEnvironment>.combine(
//    reducer1,

    counterReducer.pullback(state: \.counter,
                            action: /GameAction.counter,
                            environment: { _ in
                                GameEnvironment.live.counter
                            }),
    timerReducer.pullback(state: \.timer,
                          action: /GameAction.timer,
                          environment: { _ in
                              GameEnvironment.live.timer
                          }),
    resultReducer.pullback(state: \.result, action: /GameAction.result, environment: { _ in
        GameResultEnvironment()
    }),
    resultWrapReducer
).debug()

// let reducer1 = Reducer<GameState, GameAction, GameEnvironment> { state, action, _ in
//    switch action {
//    case let .counter(counterAction):
//        if counterAction == CounterAction.reset {
//            defer {
//                state.results.removeAll()
//            }
//            return Effect(value: .timer(.start))
//        }
//    case .timer:
//        return .none
//    }
//    return .none
// }

let resultWrapReducer = Reducer<GameState, GameAction, GameEnvironment> { state, action, _ in
    if case let .counter(countAction) = action,
       case let .setCount(count, isReset) = countAction {
        if isReset {
            let effects = [Effect<GameAction, Never>(value: GameAction.timer(.start)), Effect(value: GameAction.result(.clear))]
            return Effect.concatenate(effects)
        } else {
            let counterSate = Counter(count: count, isOn: state.counter.isOn, targetVal: state.counter.targetVal)
            let result = GameResult(counter: counterSate, timeSpent: state.timer.duration)
            return Effect(value: GameAction.result(.add(result)))
        }
    }
    return .none
}
