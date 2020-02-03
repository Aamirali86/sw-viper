//
//  DataResponse.swift
//  NetworkModule
//
//  Created by Amir on 22/10/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

enum ResponseData<T, E: Error> {
    case success(T)
    case error(E)
}
