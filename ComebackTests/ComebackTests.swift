//
//  ComebackTests.swift
//  ComebackTests
//
//  Created by Luca Gramaglia on 19/10/2020.
//

import XCTest
@testable import ComebackApp

class ComebackTests: XCTestCase {

    func testComeback() throws {
        
        let positionTracker = CoreLocationPositionTracker()
        let timeDistanceCalculator = MapKitWalkTimeDistanceCalculator()
        let needToComeback = TimeToComeback(timeToComeback: Time(hour: 10, minute: 10))
        
        let place = Place(coordinate: Coordinate(latitude: 0.0, longitude: 0.0), description: nil)
        
        let sut = ComebackTracker(positionTracker: positionTracker,
                                  timeDistanceCalculator: timeDistanceCalculator,
                                  needToComeback: needToComeback)
        sut.start(with: place) { result in
            print(result)
        }
    }
}
