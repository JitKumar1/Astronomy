//
//  PlanetaryDataModelTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryDataModelTests: AstronomyTestCase {
    
    ///
    /// Test `Planetary` with  attributes data
    ///
    func testPlanteryAttributesWithData() throws {
        let theExpectation  = expectation(description: "Planetary [Model]")
        let rawMediaType = try XCTUnwrap(MediaType.allCases.randomElement())
        //Obtains Planetary Raw
        let theRawPlanetary = PlanetaryDataModel.mockData(mediaType: rawMediaType)
        
        // Create Planetary Model with Raw Planetary Data
        
        let theData = theRawPlanetary.asData_TestingOnly()
        
        XCTAssertNotNil(theData, "Planetary Encoded data is not nil")
        
        var thePlanetaryResponse : PlanetaryDataModel?
        var thePlanetaryError: Error?
        
        do {
            thePlanetaryResponse = try JSON.decode(PlanetaryDataModel.self, from: theData)
            theExpectation.fulfill()
            
        } catch {
            thePlanetaryError = error
            theExpectation.fulfill()
        }
        
        wait(for: [theExpectation], timeout: 3)
        
        XCTAssertNil(thePlanetaryError, "Planetary no Error")
        XCTAssertNotNil(thePlanetaryResponse, "Planetary response is not nil")
        
        let thePlanetary = try XCTUnwrap(thePlanetaryResponse)
        
        XCTAssertEqual(theRawPlanetary.title, thePlanetary.title, "Planetary Title")
        XCTAssertEqual(theRawPlanetary.explanation, thePlanetary.explanation, "Planetary explanation")
        XCTAssertEqual(theRawPlanetary.date, thePlanetary.date, "Planetary date")
        XCTAssertEqual(theRawPlanetary.hdMediaURL, thePlanetary.hdMediaURL, "Planetary hdMediaURL")
        XCTAssertEqual(theRawPlanetary.mediaURL, thePlanetary.mediaURL, "Planetary mediaURL")
        XCTAssertEqual(theRawPlanetary.mediaType, thePlanetary.mediaType, "Planetary mediaType")
    }
    
    //MARK: -
    
    ///
    /// Test `Planetary` without  attributes data or Nil
    ///
    func testPlanteryAttributesWithEmptyOrNilData() throws {
        let theExpectation  = expectation(description: "Planetary [Model]")
        
        //Obtains Planetary Raw
        let theRawPlanetary = PlanetaryDataModel.mockEmptyData()
        
        // Create Planetary Model with Raw Planetary Data
        let theData = try XCTUnwrap(theRawPlanetary.asData_TestingOnly())
        
        
        var thePlanetaryResponse : PlanetaryDataModel?
        var thePlanetaryError: Error?
        
        do {
            thePlanetaryResponse = try JSON.decode(PlanetaryDataModel.self, from: theData)
            theExpectation.fulfill()
            
        } catch {
            thePlanetaryError = error
            theExpectation.fulfill()
        }
        
        wait(for: [theExpectation], timeout: 3)
        
        XCTAssertNil(thePlanetaryError, "Planetary no Error")
        XCTAssertNotNil(thePlanetaryResponse, "Planetary response is not nil")
        
        let thePlanetary = try XCTUnwrap(thePlanetaryResponse)
        
        XCTAssertEqual(theRawPlanetary, thePlanetary, "Plantery")
        
        XCTAssertTrue(theRawPlanetary.title.isEmpty, "Planetary Title")
        XCTAssertTrue(theRawPlanetary.explanation.isEmpty, "Planetary explanation")
        XCTAssertTrue(theRawPlanetary.date.isEmpty, "Planetary date")
        XCTAssertNil(theRawPlanetary.hdMediaURL, "Planetary hdMediaURL")
        XCTAssertTrue(theRawPlanetary.mediaURL.isEmpty, "Planetary mediaURL")
        XCTAssertTrue(theRawPlanetary.mediaType == .unknow, "Planetary mediaType")
    }
    
}