//
//  TimerViewTests.swift
//  TCASampleUITests
//
//  Created by ello on 2022/5/30.
//

import ComposableArchitecture
@testable import TCASample
import XCTest

extension TimerEnvironment {
    static let testScheduler = DispatchQueue.test
    static let test = TimerEnvironment(
        date: {
            Date(timeIntervalSince1970: 100)
        },
        queue: testScheduler.eraseToAnyScheduler(),
        request: {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://wwww.baidu.com")!).map { e in
                String(data: e.data, encoding: .utf8) ?? ""
            }.eraseToEffect()
        })
}

class TimerViewTests: XCTestCase {
    
    func testTimerUpdate() throws {
        let store = TestStore(
            initialState: TimerState(),
            reducer: timerReducer,
            environment: .test
        )

        store.send(.start) { $0.started = Date(timeIntervalSince1970: 100) }

        TimerEnvironment.testScheduler.advance(by: .milliseconds(3500))

        store.receive(.update) {
            $0.duration = 1
        }

        store.receive(.update) {
            $0.duration = 2
        }

        store.receive(.update) {
            $0.duration = 3
        }

        store.send(.end)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
