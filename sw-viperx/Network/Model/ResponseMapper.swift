//
//  ResponseMapper.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import ObjectMapper

protocol ResponseMapper {
    associatedtype response
    static func map(data : Any) throws -> [response]
}
