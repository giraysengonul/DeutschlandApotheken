//
//  Endpoint.swift
//  DeutschlandApotheken
//
//  Created by Hakkı Can Şengönül on 8.03.2024.
//

import Foundation

@frozen enum Endpoint{
    
    case fetchData(queryItems: [URLQueryItem])
    
    
    
    struct Constants{
        static let baseURL = "https://api.collectapi.com"
    }
    
    
    private var url: URL{
        get{
            switch self{
                
            case .fetchData:
                return URL(string: Constants.baseURL)!
            }
        }
    }
    
    private var path: String{
        get{
            switch self{
                
            case .fetchData:
                return "/germanyPharmacy/dutyPharmacy"
            }
        }
    }
    
    private var queryItems: [URLQueryItem]{
        get{
            switch self{
                
            case .fetchData(queryItems: let queryItems):
                return queryItems
            }
        }
    }
    
    private var methot: String{
        get{
            switch self{
                
            case .fetchData(_):
                return "GET"
            }
        }
    }
    
    
    private var headers: [String : String]{
        get{
            switch self{
                
            case .fetchData(_):
                guard let apiKey = KeychainWrapper.shared.load(key: "APIKEY") else{
                    return [:]
                }
                return [
                    "content-type":"application/json",
                    "authorization": String(data: apiKey, encoding: .utf8)!
                ]
            }
        }
    }

    
    public func requestBuilder() -> URLRequest?{
        return APIRequestBuilder.requestBuilder(url: url, path: path, queryItems: queryItems, methot: methot, headers: headers)
    }
    
    
}
