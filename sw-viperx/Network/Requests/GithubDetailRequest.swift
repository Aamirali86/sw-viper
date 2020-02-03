//
//  GithubDetailRequest.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubDetailRequest : BaseRequest {
    var apiURL: String
    var method: HTTPMethod = .get
    var params: Params
    
    init(username : String, repoName: String) {
        self.apiURL = "repos/\(username)/\(repoName)"
        self.params = [:]
    }
}
