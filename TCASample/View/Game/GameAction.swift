//
//  GameAction.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import Foundation

enum GameAction {
    case counter(CounterAction)
    case timer(TimerAction)
    case result(GameResultAction)
}
