//
//  TimerState.swift
//  TCASample
//
//  Created by ello on 2022/5/30.
//

import Foundation


struct TimerState {
    var started: Date? = nil
    var duration: TimeInterval = 0
    var html: String?
}

extension TimerState: Equatable {
    
}
