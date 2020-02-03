//
//  ListService.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubListService {
    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchList(username: String, completion: @escaping (ResponseData<Any, NetworkError>) -> Void) {
        let githubListRequest = GithubListRequest(username: username)

        networkManager.sendRequest(githubListRequest) { response in
            completion(response)
        }
    }

}
