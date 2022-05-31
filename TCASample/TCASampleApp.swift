//
//  TCASampleApp.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import SwiftUI

import ComposableArchitecture

@main
struct TCASampleApp: App {
    var body: some Scene {
      WindowGroup {
          GameView(store: Store<GameState, GameAction>(initialState: GameState(), reducer: gameReducer, environment: GameEnvironment.live))
//        CounterView(
//          store: Store(
//            initialState: Counter(targetVal: CounterEnvironment.live.generateRandom(-100...100)),
//            reducer: counterReducer,
//            environment: .live)
//        )
      }
    }
}
