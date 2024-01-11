//
//  PlanetaryDetailViewModelTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryDetailViewModelTests: AstronomyTestCase {

    func testDetailViewModelWithAttributeData() throws {
        let rawMediaType = try XCTUnwrap(MediaType.allCases.randomElement())
        let theRawData = PlanetaryDataModel.mockData(mediaType: rawMediaType)
        let theRawDomainModel = PlanetaryDomainModel.mockData(theRawData)
        let useCase = PlanetaryDetailUserCase(input: theRawDomainModel)
        let viewModel = PlanetaryDetailViewModel(useCase: useCase)
        
        viewModel.fetchPlanetary()
        
        XCTAssertEqual(viewModel.title, theRawDomainModel.title, "PlanetaryDomainModel title")
        XCTAssertEqual(viewModel.explanation, theRawDomainModel.explanation, "PlanetaryDomainModel explanation")
        XCTAssertEqual(viewModel.date, theRawDomainModel.date, "PlanetaryDomainModel date")
        XCTAssertEqual(viewModel.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryDomainModel hdMediaURL")
        XCTAssertEqual(viewModel.mediaURL, theRawDomainModel.mediaURL, "PlanetaryDomainModel mediaURL")
        XCTAssertEqual(viewModel.mediaType, theRawDomainModel.mediaType, "PlanetaryDomainModel mediaURL")

    }
    func testDetailViewModelWithEmptyOrNilAttributeData() throws {
        let theRawDomainModel = PlanetaryDomainModel.mockEmptyData()
        let useCase = PlanetaryDetailUserCase(input: theRawDomainModel)
        let viewModel = PlanetaryDetailViewModel(useCase: useCase)
        viewModel.fetchPlanetary()
        
        XCTAssertEqual(viewModel.title, theRawDomainModel.title, "PlanetaryDomainModel title")
        XCTAssertEqual(viewModel.explanation, theRawDomainModel.explanation, "PlanetaryDomainModel explanation")
        XCTAssertEqual(viewModel.date, theRawDomainModel.date, "PlanetaryDomainModel date")
        XCTAssertEqual(viewModel.hdMediaURL, theRawDomainModel.hdMediaURL, "PlanetaryDomainModel hdMediaURL")
        XCTAssertEqual(viewModel.mediaURL, theRawDomainModel.mediaURL, "PlanetaryDomainModel mediaURL")
        XCTAssertEqual(viewModel.mediaType, theRawDomainModel.mediaType, "PlanetaryDomainModel mediaURL")

    }
}
