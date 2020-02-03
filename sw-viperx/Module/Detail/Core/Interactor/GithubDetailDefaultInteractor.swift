//
//  GithubDetailDefaultInteractor.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift
import Swinject

protocol GithubDetailInteractor {
    func fetchDetail(reponame : String)
}

class GithubDetailDefaultInteractor : GithubDetailInteractor {
    weak var presenter : GithubDetailInteractorToPresenterProtocol?

    init() {
        store.subscribe(self) {
            $0.select({
                $0.detailState
            })
        }
    }
    
    func fetchDetail(reponame : String) {
        let provider = Container.sharedContainer.resolve(DataProvider.self, name: "GithubDetail") as? GithubDetailDataProvider
        provider?.name = reponame
        provider?.requestData()
    }
    
    deinit {
        print("deinit")
        store.unsubscribe(self)
    }
}

extension GithubDetailDefaultInteractor : StoreSubscriber {
    
    func newState(state: GithubDetailState) {
        if let data = state.model {
            presenter?.didFetchData(data: data)
        }
        if let errorMessage = state.error {
            presenter?.didGetError(error: errorMessage)
        }
    }
    
}
