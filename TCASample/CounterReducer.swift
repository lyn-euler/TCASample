//
//  CounterReducer.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import ComposableArchitecture
import Foundation

let counterReducer = Reducer<Counter, CounterAction, CounterEnvironment> {
    state, action, environment in
    switch action {
    case .increment:
        return Effect(value: .setCount(state.count + 1))
    case .decrement:
        return Effect(value: .setCount(state.count - 1))
    case .reset:
        state.targetVal = environment.generateRandom(-100 ... 100)
        return Effect(value: .setCount(0, true))
    case let .setText(text):
        guard let count = Int(text), state.count != count else {
            return .none
        }
        return Effect(value: .setCount(count))
    case let .setSlide(slide):
        let count = Int(slide)
        return Effect(value: .setCount(count))
    case let .setCount(count, _):
        state.count = count
        return .none
    case .binding:
        return .none
    }
}.binding()
