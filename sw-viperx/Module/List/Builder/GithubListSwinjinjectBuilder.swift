//
//  GithubListSwinjinjectBuilder.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class GithubListSwinjinjectBuilder: GithubListBuilder {

    func buildGithubListModule(resolver: Resolver, vc: UIViewController) {
        self.registerInteractor()
        self.registerRouter()
        self.registerPresenter(view: vc)

        let viewController = vc as! GithubListViewController
        viewController.presenter = resolver.resolve(GithubListPresenter.self)
    }

    fileprivate func registerInteractor() {
        Container.sharedContainer.register(GithubListInteractor.self) { _ in
            GithubListDefaultInteractor()
        }.initCompleted { (r, inter) in
            let interactor = inter as! GithubListDefaultInteractor
            interactor.presenter = r.resolve(GithubListPresenter.self) as? GithubListInteractorToPresenterProtocol
        }
    }

    fileprivate func registerPresenter(view: UIViewController) {
        Container.sharedContainer.register(GithubListPresenter.self) { resolver in
            GithubListDefaultPresenter(interactor: resolver.resolve(GithubListInteractor.self)!, router: resolver.resolve(GithubListRouter.self)!, view: view as! GithubListView)
            }
    }

    fileprivate func registerRouter() {
        Container.sharedContainer.register(GithubListRouter.self) { _ in
            GithubListDefaultRouter()
        }
    }
}
