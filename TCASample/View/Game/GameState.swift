//
//  GameState.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import Foundation
import IdentifiedCollections

struct GameState {
    var counter: Counter = .init(targetVal: 0)
    var timer: TimerState = .init()
    var result: GameResultState = .init()
}

