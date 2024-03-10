//
//  NetworkError.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 10.03.2024.
//

import Foundation

@frozen enum NetworkError: Error{
    case invalidURL
    case invalidRequest
    case invalidResponse
    case statusCode(Int)
    case noData
    case decodeError
    case networkError(Error)
    case clientError(Int)
    case serverError(Int)
    case unknownError
}
