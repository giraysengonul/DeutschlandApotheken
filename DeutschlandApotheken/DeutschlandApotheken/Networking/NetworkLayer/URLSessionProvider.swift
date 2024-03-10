//
//  URLSessionProvider.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 10.03.2024.
//

import Foundation
/// URLSessionProvider
final class URLSessionProvider{
    
    /// Elements
    private let urlSession: URLSession
    
    /// Init
    /// - Parameter urlSession: URLSession
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    /// urlsessionTask
    /// - Parameters:
    ///   - urlRequest: URLRequest
    ///   - completion: Data or nil, URLResponse or nil, Error or nil
    /// - Returns: <#description#>
    public func urlsessionTask(with urlRequest: URLRequest, completion: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionTask{
        urlSession.dataTask(with: urlRequest, completionHandler: completion)
    }
}
