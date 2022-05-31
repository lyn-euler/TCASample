//
//  GameResultLabel.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import ComposableArchitecture
import SwiftUI

struct GameResultLabel: View {
    let store: Store<GameResultState, GameResultAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            Text("\(viewStore.rightNum)/\(viewStore.total)")
        }
    }
}
