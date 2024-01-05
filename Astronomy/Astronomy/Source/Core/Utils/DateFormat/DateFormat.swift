//
//  DateFormat.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

extension Date {

    ///
    /// the current Date [Today]
    ///
    static var today : Date {
        Date()
    }

    ///
    /// Obtains Previous Date from Date as per Days [30]
    /// - Parameter days: the number of days
    /// - Returns: the Previous Date from date
    ///
    func date(daysFromToday days : Int = 30) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: .today) ?? .today
    }
    
}

///
/// Type that represents different date format options.
///
enum DateFormatType: Hashable {
    
    /// Option to format YYYY-MM-DD  only date style Example "[2022-08-09]" .
    case fullDateOnly
    
    /// Option custom date  format
    case custom(dateFormat: String)
    
    var dateFormat: String {
        let value: String
        switch self {
        case .fullDateOnly:
            value =  "yyyy-MM-dd"
        case .custom(let dateFormat):
            value = dateFormat
        }
        return value
    }
}

// MARK: -

///
/// Type that represents different timeZone Format
///
 enum TimeZoneStyle: Hashable {
    
    /// Indicates the time zone currently used by the system.
    case current
    
    /// Indicates the UTC  time zone.
    case utc
    
    /// Indicates The time zone currently used by the system, automatically updating to the user’s current preference `autoupdatingCurrent`.
    case auto
    
    /// Indicates The custom  time zone.
    case custom(identifier:String)
    
    //MARK: - Constant
    
    ///
    /// `default` time time none
    ///
    static let `default` : TimeZoneStyle = .current
    
    //MARK: - Properties
    
    ///
    /// Obtains the Desired the time Zone
    ///
    var timeZone : TimeZone? {
        let aTimeZone: TimeZone?
        switch self {
        case .current:
            aTimeZone = .current
        case .utc:
            aTimeZone = TimeZone(identifier: "UTC")
        case  .auto :
            aTimeZone = TimeZone.autoupdatingCurrent
        case .custom(let identifier):
            aTimeZone = TimeZone(identifier: identifier)
        }
        
        return aTimeZone
    }
}

//MARK: -

///
///  Type that represents different Date Format Style with TimeZoneStyle
///
struct DateFormatStyle : Hashable {
    
    ///
    /// Type that represents different date format options.
    ///
    let dateFormatType: DateFormatType
    
    ///
    /// Type that represents different timeZone Format
    ///
    let timeZoneStyle: TimeZoneStyle
    
    
    ///
    /// Obtains a formatted date for the given Desired date format Style.
    /// - parameter aFormat: Desired date format.
    /// - parameter aTimeZoneStyle: Desired Time Zone Type if required.
    /// - returns: A `DateFormatter` representing the formatted date,
    ///
    var dateFormatter: DateFormatter {
        let theDateFormatter =  DateFormatter()
        theDateFormatter.dateFormat = dateFormatType.dateFormat
        theDateFormatter.timeZone = timeZoneStyle.timeZone
        return theDateFormatter
    }
    //MARK: - Init
    
    ///
    /// Create different Date Format Style `DateFormatStyle`
    /// - Parameters:
    ///   - aDateFormatType: Type that represents different date format options.
    ///   - aTimeZoneStyle: Type that represents different timeZone Format
    ///
    init(dateFormatType aDateFormatType: DateFormatType,
         timeZoneStyle aTimeZoneStyle: TimeZoneStyle  = .default) {
        dateFormatType = aDateFormatType
        timeZoneStyle = aTimeZoneStyle
    }
}



//MARK: - Localization Operators

infix operator ~

//MARK: - Date to String

///
/// Creates an internationalized string from the given date value and format type.
///
/// - parameter aDate: The date to format.
/// - parameter aDateFormat: The `DateFormatType` format to use.
///
/// - returns: An internationalized date string.
///
func ~ (aDate: Date, aDateFormat: DateFormatType) -> String {
    return aDate ~ (aDateFormat ~ .current)
}

///
/// Creates an internationalized string from the given date value and format type.
///
/// - parameter aDate: The date to format.
/// - parameter aDateFormatStyle: The `DateFormatStyle` format Style to use.
///
/// - returns: An internationalized date string.
///
func ~ (aDate: Date, aDateFormatStyle : DateFormatStyle) -> String {
    aDateFormatStyle.dateFormatter.string(from: aDate)
}

///
/// Creates an internationalized string from the given date value and format type.
///
/// - parameter aDate: The date to format.
/// - parameter aDateFormat: The `DateFormatType` format to use.
///
/// - returns: An internationalized date string.
///
func ~ (aDateString: String, aDateFormat: DateFormatType) -> Date {
    return aDateString ~ (aDateFormat ~ .current)
}

//MARK: - String to Date

///
/// Creates an internationalized string from the given date value and format type.
///
/// - parameter aDate: The date to format.
/// - parameter aDateFormatStyle: The `DateFormatStyle` format Style to use.
///
/// - returns: An internationalized date string.
///
func ~ (aDateString: String, aDateFormatStyle : DateFormatStyle) -> Date {
    aDateFormatStyle.dateFormatter.date(from: aDateString) ?? .today
}


///
/// Creates an dateFromatStyle `DateFormatType` from the given format type `TimeZoneStyle` and timeZone style `DateFormatStyle`.
///
/// - parameter aDateFormatType: The `DateFormatType` format to use.
/// - parameter aTimeZoneStyle: The `TimeZoneStyle` TimeZone Style  to use.
/// - Returns: An internationalized date FormatterStyle .
///
func ~ (aDateFormatType : DateFormatType, aTimeZoneStyle: TimeZoneStyle) -> DateFormatStyle {
    return DateFormatStyle(dateFormatType: aDateFormatType, timeZoneStyle: aTimeZoneStyle)
    
}
