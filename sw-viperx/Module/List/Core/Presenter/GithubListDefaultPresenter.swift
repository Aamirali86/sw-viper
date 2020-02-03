//
//  ListDefaultPresenter.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import UIKit

protocol GithubListPresenter {
    func loadContent()
    func presentDetailView(_ detail: GithubListViewModel)
}

protocol GithubListInteractorToPresenterProtocol: class {
    func didFetchData(data: [GithubListViewModel])
    func didGetError(error: String)
}

class GithubListDefaultPresenter: GithubListPresenter {
    fileprivate let interactor: GithubListInteractor
    fileprivate let router: GithubListRouter
    fileprivate weak var view: GithubListView?

    init(interactor: GithubListInteractor, router: GithubListRouter, view: GithubListView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

    func loadContent() {
        interactor.fetchList()
    }

    func presentDetailView(_ detail: GithubListViewModel) {
        router.navigateToDetailView(from: view, withItem: detail)
    }

}

extension GithubListDefaultPresenter: GithubListInteractorToPresenterProtocol {
    func didGetError(error: String) {
        self.view?.displayError(errorMessage: error)
    }

    func didFetchData(data: [GithubListViewModel]) {
        self.view?.displayList(datasource: data)
    }
}
