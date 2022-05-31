//
//  GameResultState.swift
//  TCASample
//
//  Created by ello on 2022/5/31.
//

import Foundation
import IdentifiedCollections

struct GameResultState {
    var results = IdentifiedArrayOf<GameResult>()
}

extension GameResultState {
    var total: Int {
        results.count
    }

    var rightNum: Int {
        results.filter { $0.counter.targetVal == $0.counter.count }.count
    }
}

extension GameResultState: Equatable {
//    static func == (lhs: GameResultState, rhs: GameResultState) -> Bool {
//        return lhs.results.count == rhs.results.count
//    }
}

struct GameResult: Equatable {
//    let secret: Int
//    let guess: Int
    let counter: Counter
    let timeSpent: TimeInterval
}

extension GameResult: Identifiable {
    var id: UUID {
        counter.id
    }
}
