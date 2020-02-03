//
//  NetworkError.swift
//  NetworkModule
//
//  Created by Amir on 22/10/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

enum NetworkError: Swift.Error {
    case serverError(String)
    case internetConnection(String)
}
