//
//  HTTPHeaders.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

struct HTTPHeaders: Hashable {
    
    private var headers: [HTTPHeader] = []
    
    /// Creates an empty instance.
    init() {}
    
    ///
    /// Creates an instance from an array of `HTTPHeader`s. Duplicate case-insensitive names are collapsed into the last
    /// name and value encountered.
    /// - Parameter theHeaders: the List of Headers `HTTPHeader`
    ///
    init(headers theHeaders: [HTTPHeader]) {
        self.init()
        theHeaders.forEach { add($0) }
    }
    
    ///
    /// Creates an instance from a `[String: String]`. Duplicate case-insensitive names are collapsed into the last name
    /// and value encountered.
    /// - Parameter dictionary: theHeaders Key value pair
    ///
    init(dictionary: [String: String]) {
        self.init()
        dictionary.forEach { add(name: $0.key, value: $0.value) }
    }
    
    ///
    /// Case-insensitively updates or appends an `HTTPHeader` into the instance using the provided `name` and `value`.
    ///
    /// - Parameters:
    ///   - name:  The `HTTPHeader` name.
    ///   - value: The `HTTPHeader value.
    ///
    mutating func add(name: String, value: String) {
        update(name: name, value: value)
    }
    
    ///
    /// Case-insensitively updates or appends the provided `HTTPHeader` into the instance.
    ///
    /// - Parameter header: The `HTTPHeader` to update or append.
    ///
    mutating func add(_ header: HTTPHeader) {
        update(header)
    }
    
    ///
    /// Case-insensitively updates or appends an `HTTPHeader` into the instance using the provided `name` and `value`.
    ///
    /// - Parameters:
    ///   - name:  The `HTTPHeader` name.
    ///   - value: The `HTTPHeader value.
    ///
    mutating func update(name: String, value: String) {
        update(HTTPHeader(name: name, value: value))
    }
    
    ///
    /// Case-insensitively updates or appends the provided `HTTPHeader` into the instance.
    ///
    /// - Parameter header: The `HTTPHeader` to update or append.
    ///
    mutating func update(_ header: HTTPHeader) {
        if contains(for: header), let index = headers.index(of: header.name) {
            headers.replaceSubrange(index...index, with: [header])
        } else {
            headers.append(header)
        }
    }
    
    ///
    /// Case-insensitively removes an `HTTPHeader`, if it exists, from the instance.
    ///
    /// - Parameter name: The name of the `HTTPHeader` to remove.
    ///
    mutating func remove(name: String) {
        guard let index = headers.index(of: name) else { return }
        headers.remove(at: index)
    }
    
    ///
    /// Case-insensitively removes an `HTTPHeader`, if it exists, from the instance.
    ///
    /// - Parameter header: The instance  of the `HTTPHeader` to remove.
    ///
    mutating func remove(for header: HTTPHeader) {
        remove(name: header.name)
    }
    
    ///
    /// Sort the current instance by header name, case insensitively.
    ///
    mutating func sort() {
        headers.sort { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    ///
    /// Returns an instance sorted by header name.
    ///
    /// - Returns: A copy of the current instance sorted by name.
    ///
    func sorted() -> HTTPHeaders {
        var headers = self
        headers.sort()
        return headers
    }
    
    ///
    /// Case-insensitively find a header's value by name.
    ///
    /// - Parameter name: The name of the header to search for, case-insensitively.
    ///
    /// - Returns: The value of header, if it exists.
    ///
    func value(for name: String) -> String? {
        return header(for: name)?.value
    }
    
    ///
    /// Case-insensitively find a header' by name.
    /// - Parameter name: The name of the header to search for, case-insensitively.
    /// - Returns: The   header, if it exists.
    ///
    func header(for name: String) -> HTTPHeader? {
        guard let index = headers.index(of: name) else { return nil }
        return headers[index]
    }
    
    ///
    /// Case-insensitively find a header' by name.
    ///
    /// - Parameter header: The `HTTPHeader` to check the contiant  or not.
    /// - Returns: The   header, if it exists.
    ///
    func contains(for header: HTTPHeader) -> Bool {
        guard let index = headers.index(of: header.name) else {
            return false
        }
       return headers[index].value.lowercased().isEqual(header.value.lowercased())
    }
    
    ///
    /// Case-insensitively access the header with the given name.
    ///
    /// - Parameter name: The name of the header.
    ///
    subscript(_ name: String) -> String? {
        get { value(for: name) }
        set {
            if let value = newValue {
                update(name: name, value: value)
            } else {
                remove(name: name)
            }
        }
    }
    
    ///
    /// The dictionary representation of all headers.
    ///
    /// This representation does not preserve the current order of the instance.
    ///
    var dictionary: [String: String] {
        let namesAndValues = headers.map { ($0.name, $0.value) }
        return Dictionary(namesAndValues, uniquingKeysWith: { _, last in last })
    }
}

//MARK: - ExpressibleByArrayLiteral

extension HTTPHeaders : ExpressibleByArrayLiteral {
    
    ///
    /// the Create HTTPHeaders
    /// - Parameter elements: the Array Literal headers `HTTPHeader`
    ///
    init(arrayLiteral elements: HTTPHeader...) {
        self.init(headers: elements)
    }
}

//MARK: -

extension HTTPHeaders: Sequence {
    func makeIterator() -> IndexingIterator<[HTTPHeader]> {
        headers.makeIterator()
    }
}

//MARK: -

extension HTTPHeaders: Collection {
    
    var startIndex: Int {
        headers.startIndex
    }
    
    var endIndex: Int {
        headers.endIndex
    }
    
    subscript(position: Int) -> HTTPHeader {
        headers[position]
    }
    
    func index(after index: Int) -> Int {
        headers.index(after: index)
    }
    
    var count: Int {
        headers.count
    }
    
    mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
        headers.removeAll(keepingCapacity: keepCapacity)
    }
    
    @discardableResult
    mutating func removeAll(at index: Int) -> HTTPHeader {
        headers.remove(at: index)
    }
    
}

extension HTTPHeaders: CustomStringConvertible {
    var description: String {
        headers.map { $0.description }
            .joined(separator: "\n")
    }
}

// MARK: - HTTPHeader

/// A representation of a single HTTP header's name / value pair.
struct HTTPHeader: Hashable {
    
    //MARK: - Properties
    
    /// Name of the header.
    let name: String
    
    /// Value of the header.
    let value: String
    
    ///
    /// Creates an instance from the given `name` and `value`.
    ///
    /// - Parameters:
    ///   - name:  The name of the header.
    ///   - value: The value of the header.
    ///
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

//MARK: -

extension HTTPHeader: CustomStringConvertible {
    var description: String {
        "\(name): \(value)"
    }
    
}

//MARK: -
extension HTTPHeader {
    
    ///
    /// Returns an `Accept` header.
    ///
    /// - Parameter value: The `Accept` value.
    /// - Returns:         The header.
    ///
    static func accept(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept", value: value)
    }
    
    ///
    /// Returns an `Accept` header.
    ///
    /// - Parameter aMIMEType: The `HTTPMIMEType` value.
    /// - Returns:  The header.
    ///
    static func accept(mimeType aMIMEType: HTTPMIMEType) -> HTTPHeader {
        accept(aMIMEType.value)
    }
    
    ///
    /// Returns a `Content-Type` header.
    ///
    /// set this value.
    ///
    /// - Parameter value: The `Content-Type` value.
    ///
    /// - Returns:         The header.
    ///
    static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value)
    }
    
    ///
    /// Returns a `Content-Type` header.
    ///
    /// set this value.
    ///
    /// - Parameter aMIMEType: The `Content-Type` `HTTPMIMEType`.
    ///
    /// - Returns:         The header.
    ///
    static func contentType(_ aMIMEType: HTTPMIMEType) -> HTTPHeader {
        contentType(aMIMEType.value)
    }

}

//MARK: -

extension Array where Element == HTTPHeader {
    
    /// Case-insensitively finds the index of an `HTTPHeader` with the provided name, if it exists.
    func index(of name: String) -> Int? {
        return firstIndex { $0.name.lowercased().isEqual(name.lowercased()) }
    }
    
    ///
    /// Case-insensitively Get Header Index from List of Header `HTTPHeader`
    /// - Parameter header: The `HTTPHeader` to  find the Index
    /// - Returns: the firstIndex of appropriated of header if contains
    ///
    func index(of header: HTTPHeader) -> Int? {
        index(of: header.name)
    }
}

//MARK: -

extension HTTPHeader {
    
    ///
    /// Standard JSON content type header.
    ///
    static let contentTypeJSON = contentType(.json)
    
    ///
    /// Standard accept JSON header.
    ///
    static let acceptJSON = accept(mimeType:.json)


}
