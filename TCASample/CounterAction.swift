//
//  CounterAction.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import ComposableArchitecture
import Foundation

enum CounterAction: BindableAction {
    case increment
    case decrement
    case reset
    case setText(String)
    case setCount(Int, Bool = false)
    case setSlide(Double)
    case binding(BindingAction<Counter>)
}

extension CounterAction: Equatable {
    
}
