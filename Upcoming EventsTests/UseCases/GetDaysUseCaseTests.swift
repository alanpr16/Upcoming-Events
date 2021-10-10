//
//  GetDaysUseCaseTests.swift
//  Upcoming EventsTests
//
//  Created by Alan on 10/10/21.
//

import XCTest
@testable import Upcoming_Events

class GetDaysUseCaseTests: XCTestCase {
    
    func test_getDays() {
        let sut = makeSUT()
        
        let days = sut.invoke()
        
        XCTAssertEqual(days.count, 7)
    }
    
    private func makeSUT() -> GetDaysUseCase {
        let sut = GetDaysUseCase()
        return sut
    }

}
