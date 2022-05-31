//
//  CounterEnvironment.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import Foundation


struct CounterEnvironment {
    var generateRandom: (ClosedRange<Int>) -> Int
    static let live = CounterEnvironment(generateRandom: Int.random)
    static let test = CounterEnvironment(generateRandom: { _ in 10 })
}

