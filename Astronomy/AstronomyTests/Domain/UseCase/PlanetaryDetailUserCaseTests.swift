//
//  PlanetaryDetailUserCaseTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 11/01/24.
//

import XCTest

final class PlanetaryDetailUserCaseTests: AstronomyTestCase {

    func testDetailUseCaseWithAttributeData() throws {
        let rawMediaType = try XCTUnwrap(MediaType.allCases.randomElement())
        let theRawData = PlanetaryDataModel.mockData(mediaType: rawMediaType)
        let theRawDomainModel = PlanetaryDomainModel.mockData(theRawData)
        let useCase = PlanetaryDetailUserCase(input: theRawDomainModel)
        
       let planetary = useCase.fetchPlanetary()
        
        XCTAssertEqual(planetary.title, theRawDomainModel.title, "PlanetaryDomainModel title")
        XCTAssertEqual(planetary.explanation, theRawDomainModel.explanation, "PlanetaryDomainModel explanation")
        XCTAssertEqual(planetary.date, theRawDomainModel.date, "PlanetaryDomainModel date")
        XCTAssertEqual(planetary.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryDomainModel hdMediaURL")
        XCTAssertEqual(planetary.mediaURL, theRawDomainModel.mediaURL, "PlanetaryDomainModel mediaURL")
        XCTAssertEqual(planetary.mediaType, theRawDomainModel.mediaType, "PlanetaryDomainModel mediaURL")

    }
    func testDetailUseCaseWithEmptyOrNilAttributeData() throws {
        let theRawDomainModel = PlanetaryDomainModel.mockEmptyData()
        let useCase = PlanetaryDetailUserCase(input: theRawDomainModel)
        let planetary = useCase.fetchPlanetary()
        
        XCTAssertEqual(planetary.title, theRawDomainModel.title, "PlanetaryDomainModel title")
        XCTAssertEqual(planetary.explanation, theRawDomainModel.explanation, "PlanetaryDomainModel explanation")
        XCTAssertEqual(planetary.date, theRawDomainModel.date, "PlanetaryDomainModel date")
        XCTAssertEqual(planetary.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryDomainModel hdMediaURL")
        XCTAssertEqual(planetary.mediaURL, theRawDomainModel.mediaURL, "PlanetaryDomainModel mediaURL")
        XCTAssertEqual(planetary.mediaType, theRawDomainModel.mediaType, "PlanetaryDomainModel mediaURL")

    }
}
