//
//  PlanetaryModelTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 12/01/24.
//

import XCTest

final class PlanetaryModelTests: AstronomyTestCase {
    
    func testPlanetaryModelWithAttributeData() throws {
        let rawMediaType = try XCTUnwrap(MediaType.allCases.randomElement())
        let theRawData = PlanetaryDataModel.mockData(mediaType: rawMediaType)
        let theRawDomainModel = PlanetaryDomainModel.mockData(theRawData)
        let planetary = PresentationPlanetaryMapper.toModel(theRawDomainModel)
        
        XCTAssertEqual(planetary.title, theRawDomainModel.title, "PlanetaryModel title")
        XCTAssertEqual(planetary.explanation, theRawDomainModel.explanation, "PlanetaryModel explanation")
        XCTAssertEqual(planetary.date, theRawDomainModel.date, "PlanetaryModel date")
        XCTAssertEqual(planetary.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryModel hdMediaURL")
        XCTAssertEqual(planetary.mediaURL, theRawDomainModel.mediaURL, "PlanetaryModel mediaURL")
        XCTAssertEqual(planetary.mediaType, theRawDomainModel.mediaType, "PlanetaryModel mediaURL")
        
    }
    func testPlanetaryModelWithEmptyOrNilAttributeData() throws {
        let theRawDomainModel = PlanetaryDomainModel.mockEmptyData()
        let planetary = PresentationPlanetaryMapper.toModel(theRawDomainModel)
        
        XCTAssertEqual(planetary.title, theRawDomainModel.title, "PlanetaryModel title")
        XCTAssertEqual(planetary.explanation, theRawDomainModel.explanation, "PlanetaryModel explanation")
        XCTAssertEqual(planetary.date, theRawDomainModel.date, "PlanetaryModel date")
        XCTAssertEqual(planetary.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryModel hdMediaURL")
        XCTAssertEqual(planetary.mediaURL, theRawDomainModel.mediaURL, "PlanetaryModel mediaURL")
        XCTAssertEqual(planetary.mediaType, theRawDomainModel.mediaType, "PlanetaryModel mediaURL")
        
    }
    
}
