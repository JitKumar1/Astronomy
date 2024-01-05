//
//  DateFormatTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class DateFormatTests: AstronomyTestCase {

    func testDateFormatStyle() {
        let theDate = Date(timeIntervalSinceReferenceDate: 600_010_000)
       
        
        /// Default TimeZone Style `TimeZoneStyle.current`
        
        XCTAssertEqual(theDate ~ (.fullDateOnly ~ .default), "2020-01-06", "short date only")
       
        XCTAssertEqual(theDate ~ (.custom(dateFormat: "MM-dd-yyyy HH:mm") ~ .default), "01-06-2020 18:56", "custom date and time")
        
        /// Default TimeZone Style `TimeZoneStyle.utc`
        
        XCTAssertEqual(theDate ~ (.fullDateOnly ~ .utc), "2020-01-06", "short date only")
        XCTAssertEqual(theDate ~ (.custom(dateFormat: "MM-dd-yyyy HH:mm") ~ .utc), "01-06-2020 13:26", "custom date and time")
        
        /// Default TimeZone Style `TimeZoneStyle.auto`
        
        XCTAssertEqual(theDate ~ (.fullDateOnly ~ .auto), "2020-01-06", "short date only")
        XCTAssertEqual(theDate ~ (.custom(dateFormat: "MM-dd-yyyy HH:mm") ~ .auto), "01-06-2020 18:56", "custom date and time")
        
        /// Default TimeZone Style `TimeZoneStyle.custom(identifier:)`
        
        let timeZoneStyle: TimeZoneStyle = .custom(identifier: "America/Chicago")
        
        XCTAssertEqual(theDate ~ (.fullDateOnly ~ timeZoneStyle), "2020-01-06", "short date only")
        XCTAssertEqual(theDate ~ (.custom(dateFormat: "MM-dd-yyyy HH:mm") ~ timeZoneStyle), "01-06-2020 07:26", "custom date and time")
        

    }

}
