//
//  HTTPHeadersTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

///
/// Test suite for `HTTPHeaders`.
///
final class HTTPHeadersTests: AstronomyTestCase {

    ///
    /// Tests Case for `init(dictionary: [String: String])`
    ///
    func testInitilized_HTTPHeaders_With_Dictionary() throws {
        let theRawHeaderDictionary = HTTPHeaders.makeRandomHeaderDictTestingOnly()
        var theHeadersData = HTTPHeaders(dictionary: theRawHeaderDictionary)
        let theHeaderResults = try XCTUnwrap(theHeadersData.dictionary)
        
        for (aKey, aValue) in theHeaderResults {
            let theRawKey = try XCTUnwrap(theRawHeaderDictionary.keys.first(where: {$0.isEqual(aKey)}))
            let theRawValue = try XCTUnwrap(theRawHeaderDictionary[theRawKey])
            XCTAssertEqual(aKey, theRawKey, "Header name")
            XCTAssertEqual(aValue, theRawValue, "Header Value")
        }

        XCTAssertFalse(theHeadersData.description.isEmpty, "description")
        theHeadersData.removeAll()

    }

    ///
    /// Tests Case for `init(header: [HTTPHeader]) `
    ///
    func testInitilized_HTTPHeaders_With_Headers() throws {
        var theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        let theRawHeaderDictionary = HTTPHeaders.makeRandomHeaderDictTestingOnly()
        let theHeaderResults = try XCTUnwrap(theRawHeaders.dictionary)
        
        for (aKey, aValue) in theHeaderResults {
            let theRawKey = try XCTUnwrap(theRawHeaderDictionary.keys.first(where: {$0.isEqual(aKey)}))
            let theRawValue = try XCTUnwrap(theRawHeaderDictionary[theRawKey])
            XCTAssertNotNil(theRawHeaders[aKey], "Has Header value for key")
            XCTAssertEqual(aKey, theRawKey, "Header name")
            XCTAssertEqual(aValue, theRawValue, "Header Value")
        }
        XCTAssertTrue(theRawHeaders.contains(for: .acceptJSON))
        XCTAssertEqual(theRawHeaders.index(after: .zero), 1, "Header name")
        XCTAssertNotNil(Array(theRawHeaders).index(of: .acceptJSON))
        theRawHeaders = theRawHeaders.sorted()
       
        theRawHeaders.removeAll(at: .zero)
        theRawHeaders.removeAll()
    }

    ///
    /// Tests Case for `add(name: String, value: String)`
    ///
    func testAdd_Header_Name_Value() throws {
        let theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        let theRawHeaderDictionary = HTTPHeaders.makeRandomHeaderDictTestingOnly()

        var theHeadersData = HTTPHeaders()
        for theRawHeader in theRawHeaders {
            theHeadersData.add(name: theRawHeader.name, value: theRawHeader.value)
        }

        XCTAssertEqual(theRawHeaders.count, theHeadersData.count, "Headers count")
        let theHeaderResults = try XCTUnwrap(theHeadersData.dictionary)

        for (aKey, aValue) in theHeaderResults {
            let theRawKey = try XCTUnwrap(theRawHeaderDictionary.keys.first(where: {$0.isEqual(aKey)}))
            let theRawValue = try XCTUnwrap(theRawHeaderDictionary[theRawKey])
            XCTAssertEqual(aKey, theRawKey, "Header name")
            XCTAssertEqual(aValue, theRawValue, "Header Value")
        }
        theHeadersData.removeAll()
    }

    ///
    /// Tests Case for `add(_ header: HTTPHeader)`
    ///
    func testAdd_Header() throws {
        
        let theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        var theHeadersData = HTTPHeaders()
        for filterRowHeader in theRawHeaders {
            theHeadersData.add(filterRowHeader)
        }
        
        XCTAssertEqual(theRawHeaders.count, theHeadersData.count, "Headers count")
        
        for index in 0..<theRawHeaders.count {
            let theHeader = theHeadersData[index]
            let theRawHeader = theRawHeaders[index]
            
            XCTAssertEqual(theHeader.name, theRawHeader.name, "Header name")
            XCTAssertEqual(theHeader.value, theRawHeader.value, "Header Value")
        }
        theHeadersData.removeAll()

    }

    ///
    /// Tests Case for `update(name: String, value: String)`
    ///
    func testUpdate_Header_Name_Value() throws {
        var theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        var theHeadersData = HTTPHeaders()
        for theRawHeader in theRawHeaders {
            theHeadersData.update(name: theRawHeader.name, value: theRawHeader.value)
        }
        
        XCTAssertEqual(theRawHeaders.count, theHeadersData.count, "Headers count")
        
        ///
        /// Sort the current instance by header name, case insensitively.
        ///
        theRawHeaders.sort()
        
        theHeadersData.sort()
        for index in 0..<theRawHeaders.count {
            let theHeader = theHeadersData[index]
            let theRawHeader = theRawHeaders[index]
            
            XCTAssertEqual(theHeader.name, theRawHeader.name, "Header name")
            XCTAssertEqual(theHeader.value, theRawHeader.value, "Header Value")
            XCTAssertEqual(theHeader.description, theRawHeader.description, "Header description")
        }
        theHeadersData.removeAll()
    }

    ///
    /// Tests Case for `update(_ header: HTTPHeader)`
    ///
    func testUpdate_Header() throws {
        var theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        let theFirst = try XCTUnwrap(theRawHeaders.first)
        var theHeadersData = HTTPHeaders(arrayLiteral: theFirst)
        for theRawHeader in theRawHeaders {
            theHeadersData.update(theRawHeader)
        }
        
        XCTAssertEqual(theRawHeaders.count, theHeadersData.count, "Headers count")
        
        ///
        /// Sort the current instance by header name, case insensitively.
        ///
        theRawHeaders.sort()
        
        theHeadersData.sort()
        for index in 0..<theRawHeaders.count {
            let theHeader = theHeadersData[index]
            let theRawHeader = theRawHeaders[index]
            
            XCTAssertEqual(theHeader.name, theRawHeader.name, "Header name")
            XCTAssertEqual(theHeader.value, theRawHeader.value, "Header Value")
            XCTAssertEqual(theHeader.description, theRawHeader.description, "Header description")
        }
        theHeadersData.removeAll()

    }

    ///
    /// Tests Case for `remove(name:)`
    ///
    func testRemove_Header_Name_Value() throws {
        
        let theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        let contentTypeJSON = try XCTUnwrap(theRawHeaders.first(where: {$0.name.isEqual(HTTPHeader.contentTypeJSON.name)}))
        let filterRowHeaders = theRawHeaders.filter({!$0.name.isEqual(contentTypeJSON.name)})
        var theHeadersData = HTTPHeaders(dictionary: [contentTypeJSON.name : contentTypeJSON.value])
        for filterRowHeader in filterRowHeaders {
            theHeadersData.update(name: filterRowHeader.name, value: filterRowHeader.value)
        }
        theHeadersData.remove(name: contentTypeJSON.name)
        XCTAssertFalse(theHeadersData.dictionary.keys.contains(contentTypeJSON.name), "Header contentTypeJSON reoved")
        theHeadersData.removeAll()
    }
    
    ///
    /// Tests Case for `remove(for header: HTTPHeader)`
    ///
    func testRemove_Header() throws {
        
        let theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
        let contentTypeJSON = try XCTUnwrap(theRawHeaders.first(where: {$0.name.isEqual(HTTPHeader.contentTypeJSON.name)}))
        let filterRowHeaders = theRawHeaders.filter({!$0.name.isEqual(contentTypeJSON.name)})
        var theHeadersData = HTTPHeaders(dictionary: [contentTypeJSON.name : contentTypeJSON.value])
        for filterRowHeader in filterRowHeaders {
            theHeadersData.update(name: filterRowHeader.name, value: filterRowHeader.value)
        }
        theHeadersData.remove(for: contentTypeJSON)
        XCTAssertFalse(theHeadersData.dictionary.keys.contains(contentTypeJSON.name), "Header contentTypeJSON removed")
        theHeadersData.removeAll()
    }

}
