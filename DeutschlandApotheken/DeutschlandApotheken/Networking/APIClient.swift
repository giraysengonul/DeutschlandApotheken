//
//  APIClient.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 10.03.2024.
//

import Foundation
/// APICLient
final class APIClient{
    
    /// Elements
    private let urlSessionProvider: URLSessionProvider
    private let responseError: ResponseError
    private let responseParser: ResponseParser
    
    /// Init
    /// - Parameter urlSessionProvider: URLSessionProvider
    /// - Parameter responseError: ResponseError
    /// - Parameter responseParser: ResponseParser
    public init
    (
        urlSessionProvider: URLSessionProvider = URLSessionProvider(urlSession: .shared),
        responseError: ResponseError = ResponseError(),
        responseParser: ResponseParser = ResponseParser()
    )
    {
        self.urlSessionProvider = urlSessionProvider
        self.responseError = responseError
        self.responseParser = responseParser
    }
    
    
    /// Fetch data Process
    /// - Parameters:
    ///   - urlRequest: URLRequest
    ///   - parsingModel: Codable Model
    ///   - completion: Data or Error
    func fecthData<T: Codable>(with urlRequest: URLRequest, parsingModel: T.Type ,completion: @escaping(Result<T,Error>) -> Void){
        urlSessionProvider.urlsessionTask(with: urlRequest, completion: {[weak self] data, response, error in
            
            guard error != nil else{
                completion(.failure(NetworkError.invalidURL))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard (200...300).contains(response.statusCode)else{
                completion(.failure(self?.responseError.parseError(statusCode: response.statusCode) ?? .serverError(response.statusCode)))
                return
            }
            guard let data = data else{
                completion(.failure(NetworkError.noData))
                return
            }
            
            self?.responseParser.responseParser(responseData: data, responseModel: T.self) { result in
                switch result{
                    
                case .success(let model):
                    completion(.success(model))
                    return
                case .failure(let error):
                    completion(.failure(error))
                    return
                }
            }
        }
        )
        .resume()
    }
    
    
    
}
