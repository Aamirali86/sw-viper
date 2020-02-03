//
//  BaseRequest.swift
//  NetworkModule
//
//  Created by Amir on 11/09/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

private let _tokenHeaderKey = "Authorization"
private let _contentType = "Content-Type"

public typealias Params = [String: Any]
public typealias Headers = [String: String]

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

protocol BaseRequest {
    var apiURL: String { get }
    var method: HTTPMethod { get }
    var params: Params { get }
    var headers: Headers { get }
    var url: String { get }
}

extension BaseRequest {
    
    var baseUrl : String  {
        get { return "https://api.github.com/" }
    }
    
    var headers: Headers {
        var headers = [_contentType: "application/json"]
        
        guard let token = Self.getToken() else { return headers }
        headers[_tokenHeaderKey] = token
        return headers
    }
    
    var url: String {
        return baseUrl + apiURL
    }
    
}

//For testing
extension BaseRequest {
    static func getToken() -> String? {
        //TODO: store token and get if available
        return "lk312kbi3asd45"
    }
}
