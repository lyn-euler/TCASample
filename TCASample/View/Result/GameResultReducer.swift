//
//  GameResultReducer.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//
import ComposableArchitecture
import Foundation

let resultReducer = Reducer<GameResultState, GameResultAction, GameResultEnvironment> { state, action, _ in
    switch action {
    case let .add(result):
        state.results.append(result)
    case .clear:
        state.results.removeAll()
    }
    return .none
}
