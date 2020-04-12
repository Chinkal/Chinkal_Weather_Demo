//
//  Location.swift
//  Chinkal_Weather_DemoTests
//
//  Created by chinkalshah on 12/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import XCTest
@testable import Chinkal_Weather_Demo

class Location: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLocation() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let currentLocation = LocationManager.shared.simulatedLocation()
        XCTAssert(currentLocation.coordinate.latitude == 18.5204 && currentLocation.coordinate.longitude == 73.8567, "Error getting the pune location")
    }
    
    func testCityName() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        _ = LocationManager.shared.simulatedLocation()
        let cityName = LocationManager.shared.cityName
        XCTAssert(cityName != nil, "Error getting the pune city")
    }


}
