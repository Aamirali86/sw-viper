//
//  SharedContainer.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension Container {

    static let sharedContainer:Container = {
        let c = Container()
        
        c.register(NetworkManager.self, factory: { _ in AlamofireManager() })
        
        c.register(CoreDataManager.self, factory: { _ in
            CoreDataManager(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        })
        
        c.register(GithubListRepository.self) { resolver in
            GithubListRepository(dbManager: resolver.resolve(CoreDataManager.self)!, entityName: String(describing: GithubItem.self))
        }
        
        c.register(DataProvider.self, name: "GithubList") { r in
            GithubListDataProvider(dataRepository: r.resolve(GithubListRepository.self)!)
        }
        c.register(DataProvider.self, name: "GithubDetail") { r in
            GithubDetailDataProvider()
        }

        c.register(GithubListService.self) { r in
            GithubListService(networkManager: r.resolve(NetworkManager.self)!)
        }
        c.register(GithubDetailService.self) { r in
            GithubDetailService(networkManager: r.resolve(NetworkManager.self)!)
        }

        c.register(GithubListBuilder.self, factory: { _ in GithubListSwinjinjectBuilder() })
        c.register(GithubDetailBuilder.self, factory: { _ in GithubDetailSwinjectBuilder() })

        return c
    }()
}

extension SwinjectStoryboard {
    @objc class func setup() {
        Container.sharedContainer.storyboardInitCompleted(GithubListViewController.self) { resolver, view in
            let builder = resolver.resolve(GithubListBuilder.self)
            builder?.buildGithubListModule(resolver: resolver, vc: view)
        }
        
        Container.sharedContainer.storyboardInitCompleted(GithubDetailViewContorller.self) { resolver, view in
            let builder = resolver.resolve(GithubDetailBuilder.self)
            builder?.buildGithubDetailModule(resolver: resolver, vc: view)
        }
    }
}
