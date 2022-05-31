//
//  TimerAction.swift
//  TCASample
//
//  Created by ello on 2022/5/30.
//

import Foundation
//import ComposableArchitecture

enum TimerAction {
    case start
    case end
    case update
    
    case load
    case loaded(Result<String,URLError>)
}

extension TimerAction: Equatable {
    
}
