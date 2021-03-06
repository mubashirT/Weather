//
//  OfflineCityServiceTest.swift
//  WeatherTests
//
//  Created by Arslan Faisal on 01/12/2019.
//  Copyright © 2019 Arslan Faisal. All rights reserved.
//

import XCTest
@testable import Weather

class OfflineCityServiceTest: XCTestCase {

    var cityService: OfflineCityService!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cityService = OfflineCityService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cityService = nil
    }

    func testOfflineCitiesFetch() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cityReceivedPromise = expectation(description: "Data is received Successfully")
        cityService.fetchCities { (cities, error) in
            cityReceivedPromise.fulfill()
            XCTAssertNil(error, error ?? "Recieved some error")
            XCTAssertNotNil(cities, "weather API response is nil")
            if let count = cities?.count {
                XCTAssertGreaterThan(count, 0, "forcasts list is empty")
            }
        }
        wait(for: [cityReceivedPromise], timeout: 15.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
