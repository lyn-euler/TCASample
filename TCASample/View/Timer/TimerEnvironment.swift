//
//  TimerEnvironment.swift
//  TCASample
//
//  Created by ello on 2022/5/30.
//

import Combine
import CombineSchedulers
import ComposableArchitecture
import Foundation

typealias RequestBuilder = () -> Effect<String, URLError>
typealias DateBuilder = () -> Date

struct TimerEnvironment {
    let request: RequestBuilder?
    let date: DateBuilder
    let queue: AnySchedulerOf<DispatchQueue>

    init(date: @escaping DateBuilder = Date.init,
         queue: AnySchedulerOf<DispatchQueue> = .main,
         request: RequestBuilder? = nil) {
        self.date = date
        self.queue = queue
        self.request = request
    }
}

extension TimerEnvironment {
    static let live = TimerEnvironment(request: {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://wwww.baidu.com")!).map { e in
            String(data: e.data, encoding: .utf8) ?? ""
        }.eraseToEffect()
    })
}
