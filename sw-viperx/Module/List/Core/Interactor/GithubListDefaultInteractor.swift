//
//  ListDefaultInteractor.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Swinject
import ReSwift

protocol GithubListInteractor {
    func fetchList()
}

class GithubListDefaultInteractor: GithubListInteractor {
    weak var presenter: GithubListInteractorToPresenterProtocol?

    init() {
        store.subscribe(self) {
            $0.select {
                $0.listState
                }.skipRepeats({ oldState, nextState in
                    return oldState.list == nextState.list
                })
        }
    }

    func fetchList() {
        let provider = Container.sharedContainer.resolve(DataProvider.self, name: "GithubList") as? GithubListDataProvider
        provider?.requestData()
    }

    deinit {
        print("deinit")
        store.unsubscribe(self)
    }
}

extension GithubListDefaultInteractor: StoreSubscriber {
    func newState(state: GithubListState) {
        presenter?.didFetchData(data: state.list)
        if let errorMessage = state.error {
            presenter?.didGetError(error: errorMessage)
        }
    }

}
