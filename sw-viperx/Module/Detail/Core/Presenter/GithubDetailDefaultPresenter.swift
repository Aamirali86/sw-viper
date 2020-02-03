//
//  GithubDetailDefaultPresenter.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

protocol GithubDetailPresenter {
    func loadContent(with model : GithubListViewModel)
}

protocol GithubDetailInteractorToPresenterProtocol : class {
    func didFetchData(data : GithubDetailViewModel)
    func didGetError(error : String)
}

class GithubDetailDefaultPresenter : GithubDetailPresenter {
    fileprivate let interactor: GithubDetailInteractor
    fileprivate let router: GithubDetailRouter
    fileprivate weak var view: GithubDetailView?
    
    init(interactor: GithubDetailInteractor, router: GithubDetailRouter, view: GithubDetailView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func loadContent(with model: GithubListViewModel) {
        interactor.fetchDetail(reponame : model.name ?? "")
    }
    
}

extension GithubDetailDefaultPresenter : GithubDetailInteractorToPresenterProtocol {
    func didFetchData(data: GithubDetailViewModel) {
        self.view?.displayDetailView(data: data)
    }
    
    func didGetError(error: String) {
        self.view?.displayError(errorMessage: error)
    }
}
