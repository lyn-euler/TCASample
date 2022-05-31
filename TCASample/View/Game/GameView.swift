//
//  GameView.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import ComposableArchitecture
import SwiftUI

struct GameView: View {
    let store: Store<GameState, GameAction>
    var body: some View {
        WithViewStore(store.stateless) { viewStore in
            VStack {
                HStack {
                    GameResultLabel(store: store.scope(state: \.result, action: GameAction.result))
                }
                VStack {
                    TimerView(store: store.scope(state: \.timer, action: GameAction.timer))
                    CounterView(store: store.scope(state: \.counter, action: GameAction.counter))
                }.onAppear {
                    viewStore.send(.timer(.start))
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(store: Store<GameState, GameAction>(initialState: GameState(), reducer: gameReducer, environment: GameEnvironment()))
    }
}
