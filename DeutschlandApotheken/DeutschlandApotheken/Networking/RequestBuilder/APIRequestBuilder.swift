//
//  APIRequestBuilder.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 8.03.2024.
//

import Foundation

/// APIequestBuilder
final class APIRequestBuilder{
    
    /// Request Builder Process
    /// - Parameters:
    ///   - url: URL
    ///   - path: path
    ///   - queryItems: query Items
    ///   - methot: methot(GET,POST,...)
    ///   - headers: headers
    /// - Returns: URLRequest or Nil
    public static func requestBuilder(url: URL, path: String, queryItems: [URLQueryItem], methot: String, headers: [String : String]) -> URLRequest?{
       
        guard let componentUrl = URLComponents(url: url.appendingPathComponent(path).appending(queryItems: queryItems), resolvingAgainstBaseURL: true) else{
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methot
        request.allHTTPHeaderFields = headers
        return request
    }
}
