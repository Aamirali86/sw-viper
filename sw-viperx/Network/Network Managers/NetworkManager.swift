//
//  NetworkManager.swift
//  NetworkModule
//
//  Created by Amir on 21/10/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

protocol NetworkManager {
    //func sendRequest<E>(_ request : BaseRequest, completion : @escaping ((ResponseData<E, NetworkError>) -> Void))
    func sendRequest(_ request: BaseRequest, completion: @escaping (ResponseData<Any, NetworkError>) -> Void)
}
