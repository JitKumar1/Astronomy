//
//  PlanetaryListViewModelTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryListViewModelTests: AstronomyTestCase {

    @MainActor 
    func testPlanetaryListViewModelSuccess() throws {
        let expectation = expectation(description: "PlanetaryListViewModel With Success")
        let useCase = PlanetaryListUseCase(repository: PlanetaryListRepository(service: MockPlanetaryListService()))
        let vieModel = PlanetaryListViewModel(useCase: useCase)
       
        vieModel.fetchPlanetaryList()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertTrue(vieModel.errorMessage.isEmpty, "PlanetaryListViewModel No Error ")
        XCTAssertFalse(vieModel.isEmpty, "PlanetaryDomainModel response")
        let planetary = try XCTUnwrap(vieModel.planetaries.first)
        XCTAssertEqual(planetary.title,  "Pick a Galaxy, Any Galaxy", "title")
        XCTAssertEqual(planetary.date ~ .fullDateOnly,  "2002-01-17", "date")
        XCTAssertNotNil(planetary.mediaURL,  "mediaURL")
        XCTAssertNotNil(planetary.hdMediaURL,  "hdMediaURL")
        XCTAssertEqual(planetary.mediaType, .image, "mediaType")
        
    }
    
    @MainActor 
    func testPlanetaryListViewModelFailure() throws {
        let expectation = expectation(description: "PlanetaryListViewModel With Success")
        let service = MockPlanetaryListErrorService()
        let useCase = PlanetaryListUseCase(repository: PlanetaryListRepository(service:service))
        let vieModel = PlanetaryListViewModel(useCase: useCase)
        
        vieModel.fetchPlanetaryList()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertFalse(vieModel.errorMessage.isEmpty, "Error Message")
        XCTAssertTrue(vieModel.isEmpty, "PlanetaryDomainModel response")
        
    }

}
