//
//  ListRequest.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubListRequest : BaseRequest {
    var apiURL: String
    var method: HTTPMethod = .get
    var params: Params
    
    init(username : String) {
        self.apiURL = "users/\(username)/repos"
        self.params = [
            "per_page": "50"
        ]
    }
}
