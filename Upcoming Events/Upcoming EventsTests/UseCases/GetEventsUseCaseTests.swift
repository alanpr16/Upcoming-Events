//
//  GetEventsUseCaseTests.swift
//  Upcoming EventsTests
//
//  Created by Alan on 10/10/21.
//

import XCTest
@testable import Upcoming_Events

class GetEventsUseCaseTests: XCTestCase {

    func test_getEvents() {
        let sut = makeSUT()
        let events = sut.invoke()
        XCTAssertEqual(events.count, 19)
    }
    
    private func makeSUT() -> GetEventsUseCase {
        let sut = GetEventsUseCase()
        return sut
    }
}
