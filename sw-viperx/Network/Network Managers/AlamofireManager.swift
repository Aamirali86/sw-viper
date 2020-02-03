//
//  AlamofireManager.swift
//  NetworkModule
//
//  Created by Amir on 21/10/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager: NetworkManager {

    //wrapper convert NetworkModule.HTTPMethod to Alamofire.HTTPMethod
    private func getHTTPMethod(from method:HTTPMethod) -> Alamofire.HTTPMethod {
        switch method {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
    
    func sendRequest(_ request: BaseRequest, completion: @escaping (ResponseData<Any, NetworkError>) -> Void) {
        
        if let _ = NetworkReachabilityManager()?.isReachable {
            print("url: \(request.url)")
            print("params: \(request.params)")
            print("headers: \(request.headers)")
            
            let  dataRequest = Alamofire.request(request.url, method: getHTTPMethod(from: request.method), parameters: request.params, encoding: URLEncoding.default, headers: request.headers)
            
            dataRequest.responseJSON { response in
                print("Success: \(response.result.isSuccess)")
                
                if let alamoError = response.result.error {
                    completion(.error(NetworkError.serverError(alamoError.localizedDescription)))
                } else if let data = response.result.value {
                    completion(.success(data))
                }
            }
        } else {
            completion(.error(NetworkError.internetConnection("No internet connection")))
        }
        
    }
    
}


