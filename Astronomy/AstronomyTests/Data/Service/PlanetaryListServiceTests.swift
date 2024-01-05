//
//  PlanetaryListServiceTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryListServiceTests: AstronomyTestCase {

    func testPlanetaryListServiceSuccess() throws {
        let expectation = expectation(description: "MockPlanetaryListService With Success")
        let service = MockPlanetaryListService()
        
        var planteryList: [PlanetaryDataModel] = []
        var theError: Error? = nil
        
        service.fetchPlanetaryList()
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
        XCTAssertEqual(planetary.date,  "2002-01-17", "date")
        XCTAssertFalse(planetary.mediaURL.isEmpty,  "mediaURL")
        XCTAssertNotNil(planetary.hdMediaURL,  "hdMediaURL")
        XCTAssertEqual(planetary.mediaType, .image, "mediaType")
        
    }
    
    func testPlanetaryListServiceFailure() throws {
        let expectation = expectation(description: "PlanetaryListUseCase With Success")
        let service = MockPlanetaryListErrorService()
        
        var response: [PlanetaryDataModel] = []
        var theError: Error? = nil
        
        service.fetchPlanetaryList()
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
