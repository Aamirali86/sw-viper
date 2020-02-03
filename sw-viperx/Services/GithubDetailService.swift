//
//  GithubDetailService.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubDetailService {
    private var networkManager:NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDetail(repo : String, completion: @escaping (ResponseData<Any, NetworkError>) -> Void) {
        let githubDetailRequest = GithubDetailRequest(username: "Aamirali86", repoName: repo)
        
        networkManager.sendRequest(githubDetailRequest) { response in
            completion(response)
        }
    }
    
}
