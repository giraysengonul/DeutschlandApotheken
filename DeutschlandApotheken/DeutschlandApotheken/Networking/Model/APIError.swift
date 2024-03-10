//
//  APIError.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 10.03.2024.
//

import Foundation
struct APIError: Codable {
    let code: Int
    let message: String
}
