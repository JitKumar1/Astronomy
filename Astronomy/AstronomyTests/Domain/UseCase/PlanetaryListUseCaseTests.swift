//
//  PlanetaryListUseCaseTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryListUseCaseTests: AstronomyTestCase {


    func testPlanetaryListUseCaseSuccess() throws {
        let expectation = expectation(description: "PlanetaryListUseCase With Success")
        let useCase = PlanetaryListUseCase(repository: PlanetaryListRepository(service: MockPlanetaryListService()))
        
        var planteryList: [PlanetaryDomainModel] = []
        var theError: Error? = nil
        
        useCase.fetchPlanetaryList()
            .done { list in
                planteryList = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertNil(theError, "PlanetaryListUseCase Got Success response")
        XCTAssertFalse(planteryList.isEmpty, "PlanetaryDomainModel response")
        let planetary = try XCTUnwrap(planteryList.first)
        XCTAssertEqual(planetary.title,  "Pick a Galaxy, Any Galaxy", "title")
        XCTAssertEqual(planetary.date ~ .fullDateOnly,  "2002-01-17", "date")
        XCTAssertNotNil(planetary.mediaURL,  "mediaURL")
        XCTAssertNotNil(planetary.hdMediaURL,  "hdMediaURL")
        XCTAssertEqual(planetary.mediaType, .image, "mediaType")
        
    }
    
    func testPlanetaryListUseCaseFailure() throws {
        let expectation = expectation(description: "PlanetaryListUseCase With Success")
        let useCase = PlanetaryListUseCase(repository: PlanetaryListRepository(service: MockPlanetaryListErrorService()))
        
        var response: [PlanetaryDomainModel] = []
        var theError: Error? = nil
        
        useCase.fetchPlanetaryList()
            .done { list in
                response = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(theError, "PlanetaryListUseCase Got Success response")
        XCTAssertTrue(response.isEmpty, "PlanetaryDomainModel response")
        
    }
}
