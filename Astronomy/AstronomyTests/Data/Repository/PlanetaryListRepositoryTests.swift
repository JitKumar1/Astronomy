//
//  PlanetaryListRepositoryTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class PlanetaryListRepositoryTests: AstronomyTestCase {

    func testPlanetaryListRespositorySuccess() throws {
        let expectation = expectation(description: "PlanetaryListRepository With Success")
        let repository =  PlanetaryListRepository(service: MockPlanetaryListService())
        
        var planteryList: [PlanetaryDomainModel] = []
        var theError: Error? = nil
        
        repository.fetchPlanetaryList()
            .done { list in
                planteryList = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertNil(theError, "PlanetaryListRepository Got Success response")
        XCTAssertFalse(planteryList.isEmpty, "PlanetaryDomainModel response")
        let planetary = try XCTUnwrap(planteryList.first)
        XCTAssertEqual(planetary.title,  "Pick a Galaxy, Any Galaxy", "title")
        XCTAssertEqual(planetary.date ~ .fullDateOnly,  "2002-01-17", "date")
        XCTAssertNotNil(planetary.mediaURL,  "mediaURL")
        XCTAssertNotNil(planetary.hdMediaURL,  "hdMediaURL")
        XCTAssertEqual(planetary.mediaType, .image, "mediaType")
        
    }
    
    func testPlanetaryListRepositoryFailure() throws {
        let expectation = expectation(description: "PlanetaryListRepository With Success")
        let repository = PlanetaryListRepository(service: MockPlanetaryListErrorService())
        
        var response: [PlanetaryDomainModel] = []
        var theError: Error? = nil
        
        repository.fetchPlanetaryList()
            .done { list in
                response = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(theError, "PlanetaryListRepository Got Success response")
        XCTAssertTrue(response.isEmpty, "PlanetaryDomainModel response")
        
    }

}
