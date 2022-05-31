//
//  GameEvnironment.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import Foundation

struct GameEnvironment {
    let timer = TimerEnvironment.live
    let counter = CounterEnvironment.live

    static let live = GameEnvironment()
}
