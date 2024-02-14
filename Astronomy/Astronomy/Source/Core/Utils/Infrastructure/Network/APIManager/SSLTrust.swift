//
//  SSLTrust.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 14/02/24.
//

import Foundation

final class SSLTrust: NSObject, URLSessionDelegate {
    
    static let shared = SSLTrust()
    
    private override init() {
        super.init()
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        completionHandler(.useCredential, URLCredential(trust: serverTrust))
    }
    
}
