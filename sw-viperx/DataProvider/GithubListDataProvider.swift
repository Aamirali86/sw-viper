//
//  GithubListDataProvider.swift
//  sw-viperx
//
//  Created by Amir on 05/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class GithubListDataProvider: DataProvider {
    var githubRepository: GithubListRepository!
    var username = "Aamirali86"

    init(dataRepository: GithubListRepository) {
        self.githubRepository = dataRepository
    }

    func requestData() {
        if shouldMakeNetworkCall() {
            getDataFromNetwork()
        } else {
            getDataFromRepository()
        }
    }

    private func getDataFromNetwork() {
        let service = GithubListServiceBuilder()
            .build()
        service.fetchList(username: username) { response in

            switch response {
            case .success(let data):
                let array = data as! [[String: Any]]
                do {
                    let list = try GithubListMapper.map(data: array)
                    UserDefaultManager.sharedInstance.setGithubListLastUpdateTime()
                    self.saveDataToRepository(data: list)

                    store.dispatch(GithubListAction.success(list))

                } catch(let error) {
                    store.dispatch(GithubListAction.failure(error.localizedDescription))
                }

            case .error(let error):
                switch error {
                case .internetConnection(let errorMessage), .serverError(let errorMessage):
                    store.dispatch(GithubListAction.success(self.githubRepository.fetchAll()))
                    store.dispatch(GithubListAction.failure(errorMessage))
                }
            }
        }

    }

    private func saveDataToRepository(data: [GithubListViewModel]) {
        if data.count > 0 {
            githubRepository.deleteAll()
            githubRepository.save(data)
        }
    }

    private func getDataFromRepository() {
        let list = githubRepository.fetchAll()
        store.dispatch(GithubListAction.success(list))
    }

    private func shouldMakeNetworkCall() -> Bool {
        if let lastUpdateTime = UserDefaultManager.sharedInstance.getGithubListLastUpdatedTime() {
            let timeInterval = -1 * lastUpdateTime.timeIntervalSinceNow / 60.0
            return timeInterval >= Constants.kOffersLastUpdateInterval
        }

        return true
    }

}
