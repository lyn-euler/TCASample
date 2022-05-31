//
//  ContentView.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import ComposableArchitecture
import SwiftUI

struct ResultLabel: View {
    let result: Counter.Result
    var body: some View {
        switch result {
        case .greater:
            Label("Greater", systemImage: "greaterthan.circle").foregroundColor(.red)
        case .lower:
            Label("Lower", systemImage: "lessthan.circle").foregroundColor(.red)
        default:
            Label("Correct", systemImage: "checkmark.circle").foregroundColor(.green)
        }
    }
}

struct CounterView: View {
    let store: Store<Counter, CounterAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
//                TimerView(store: Store(initialState: TimerState(), reducer: timerReducer, environment: TimerEnvironment.live))
                
                ResultLabel(result: viewStore.state.check())
                Toggle("Toggle", isOn: viewStore.binding(\.$isOn))
                TextField("input", text: viewStore.binding(get: \.countText, send: CounterAction.setText)
                )
                .multilineTextAlignment(.center)
                .background { Color.red }

                HStack {
                    Button("-") { viewStore.send(.decrement) }
                    Text("\(viewStore.count)")
                        .foregroundColor(viewStore.colorForCount)
                    Button("+") { viewStore.send(.increment) }
                }
                Button("Reset") { viewStore.send(.reset) }
                Slider(value: viewStore.binding(get: \.slide, send: CounterAction.setSlide), in: -100...100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            store: Store(
                initialState: Counter(targetVal: 10),
                reducer: counterReducer,
                environment: .live
            )
        )
    }
}
