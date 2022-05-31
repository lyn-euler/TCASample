//
//  TimerView.swift
//  TCASample
//
//  Created by ello on 2022/5/30.
//

import ComposableArchitecture
import SwiftUI

struct TimerView: View {
    let store: Store<TimerState, TimerAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                Label(
                    viewStore.started == nil ? "-" : "\(viewStore.started!.formatted(date: .omitted, time: .standard))",
                    systemImage: "clock"
                )
                Label(
                    "\(viewStore.duration, format: .number)s",
                    systemImage: "timer"
                )
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static let store = Store(initialState: .init(), reducer: timerReducer, environment: .live)
    static var previews: some View {
        VStack {
            WithViewStore(store) { viewStore in
                VStack {
                    TimerView(store: store)
                    Label(viewStore.html ?? "--", image: "")
                    HStack {
                        Button("Start") { viewStore.send(.start) }
                        Button("Stop") { viewStore.send(.end) }
                        Button("load") { viewStore.send(.load) }
                    }.padding()
                }
            }
        }
    }
}
