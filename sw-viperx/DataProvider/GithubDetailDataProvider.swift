//
//  GithubDetailDataProvider.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubDetailDataProvider: DataProvider {
    var name = ""

    func requestData() {
        getDataFromNetwork()
    }

    private func getDataFromNetwork() {
        let service = GithubDetailServiceBuilder()
            .build()
        service.fetchDetail(repo: name) { response in

            switch response {
            case .success(let data):
                let dic = data as! [String: Any]
                do {
                    let list = try GithubDetailMapper.map(data: dic)
                    store.dispatch(GithubDetailAction.success(list.first!))

                } catch(let error) {
                    store.dispatch(GithubDetailAction.failure(error.localizedDescription))
                }

            case .error(let error):
                switch error {
                case .internetConnection(let errorMessage), .serverError(let errorMessage):
                    store.dispatch(GithubDetailAction.failure(errorMessage))
                }
            }
        }
    }

}
