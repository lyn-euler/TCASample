//
//  count.state.swift
//  TCASample
//
//  Created by ello on 2022/5/18.
//

import SwiftUI
import ComposableArchitecture

struct Counter: Equatable {
    var count: Int = 0

    @BindableState var isOn: Bool = false
    var targetVal: Int
    let id: UUID = UUID()
}

extension Counter {
    enum Result {
        case lower
        case equal
        case greater
    }

    func check() -> Result {
        if count == targetVal {
            return .equal
        } else if count < targetVal {
            return .lower
        }
        return .greater
    }
}

extension Counter {
    var colorForCount: Color? {
        if count == 0 {
            return nil
        }
        if count > 0 {
            return .green
        }
        return .red
    }

    var countText: String {
        get {
            String(count)
        }
//        set {
//            if let val = Int(newValue) {
//                count = val
//            }
//        }
    }

    var slide: Double {
        get {
            Double(count)
        }
//        set {
//            count = Int(newValue)
//        }
    }
}
