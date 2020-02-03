//
//  GithubDetailSwinjectBuilder.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Swinject

class GithubDetailSwinjectBuilder : GithubDetailBuilder {
    
    internal func buildGithubDetailModule(resolver: Resolver, vc: UIViewController) {
        self.registerPresenter(view : vc)
        self.registerInteractor()
        self.registerRouter()
        
        let viewController = vc as! GithubDetailViewContorller
        viewController.presenter = resolver.resolve(GithubDetailPresenter.self)
    }
    
    fileprivate func registerPresenter(view : UIViewController) {
        Container.sharedContainer.register(GithubDetailPresenter.self) { resolver in
            GithubDetailDefaultPresenter(
                interactor: resolver.resolve(GithubDetailInteractor.self)!,
                router: resolver.resolve(GithubDetailRouter.self)!,
                view: view as! GithubDetailView)
        }
    }
    
    fileprivate func registerInteractor() {
        Container.sharedContainer.register(GithubDetailInteractor.self) { resolver in
            GithubDetailDefaultInteractor()
        }.initCompleted { (r, inter) in
            let interactor = inter as! GithubDetailDefaultInteractor
            interactor.presenter = r.resolve(GithubDetailPresenter.self) as? GithubDetailInteractorToPresenterProtocol
        }
    }
    
    fileprivate func registerRouter() {
        Container.sharedContainer.register(GithubDetailRouter.self) { _ in
            GithubDetailDefaultRouter()
        }
    }
    
}
