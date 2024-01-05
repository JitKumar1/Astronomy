//
//  PlanetaryListRequest.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

final class PlanetaryListRequest: APIRequest {
   
   //MARK: - Properties
   
   ///
   /// The start of a date range, when requesting date for a range of dates
   ///
    var startDate: String
   
   ///
   /// The end of the date range, when used with start_date.
   ///
     var endDate: String
   
   ///
   /// Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored.
   ///
    var isThumb:Bool
   
   ///
   /// the request api endpoint
   ///
   var endpoint: Endpoint  {
       .planetaryList
   }
   
   ///
   /// the request method
   ///
   var method: HTTPMethod {
       .get
   }
   
   ///
   /// the request Query parameter Items
   ///
   var parameters: APIQueryItems {
       let queryItems = APIQueryItems(arrayLiteral: queryItem(startDate, forKey: .startDate),
                                      queryItem(endDate, forKey: .endDate),
                                      queryItem(isThumb.description, forKey: .thumbs))
       return endpoint.append(parameters: queryItems)
   }
   
   // MARK: - Instance
   
   ///
   /// Create Planetary List Request specified the Start
   /// - Parameters:
   ///   - startDate: the planetary List request start date
   ///   - endDate:  the planetary List request end date
   ///   - isThumb: Return the URL of video thumbnail. If an APOD is not a video, this parameter is ignored. `default = false`
   ///
   init(startDate: String, endDate: String, isThumb: Bool = false) {
       self.startDate = startDate
       self.endDate = endDate
       self.isThumb = isThumb
   }
}

extension PlanetaryListRequest {
   
   struct QueryItemKey: RawRepresentable {
       
       var rawValue: String
       var key: String {
           rawValue
       }
       
       static let thumbs = QueryItemKey(rawValue: "thumbs")
       static let startDate = QueryItemKey(rawValue: "start_date")
       static let endDate = QueryItemKey(rawValue: "end_date")
       
      
   }

   ///
   /// Create API Query Item specified the Value an Key name
   /// - Parameters:
   ///   - value: api query Item value
   ///   - queryKey: api query item Key name
   /// - Returns: A `APIQueryItem`
   ///
   func queryItem(_ value: String, forKey queryKey: QueryItemKey) -> APIQueryItem {
       APIQueryItem(name: queryKey.key, value: value)
   }
}

