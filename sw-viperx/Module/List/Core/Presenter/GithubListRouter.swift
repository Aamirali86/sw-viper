//
//  ListRouter.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit

protocol GithubListRouter {
    
    static func getListViewController() -> UIViewController?
    
    func navigateToDetailView(from view: GithubListView?, withItem item: GithubListViewModel)
}
