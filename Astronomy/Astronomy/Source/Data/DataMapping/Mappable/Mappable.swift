//
//  Mappable.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol Mappable {
    associatedtype Input
    associatedtype Output
   static func toDomain(_ input: Input) -> Output
}
