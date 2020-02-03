//
//  ListRouter.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit

class GithubListDefaultRouter : GithubListRouter {
    
    static func getListViewController() -> UIViewController? {
        guard let listVC = GithubListDefaultRouter.initializeViewController() as? GithubListViewController else { return nil }
        return listVC
    }
    
    func navigateToDetailView(from view:GithubListView?, withItem item: GithubListViewModel) {
        guard let toVC = GithubDetailDefaultRouter.getDetailViewController() as? GithubDetailViewContorller,
            let fromVC = view as? UIViewController else { return }
        toVC.model = item
        fromVC.navigationController?.pushViewController(toVC, animated: true)
    }
    
}

extension GithubListDefaultRouter : Initializable {}
