//
//  File.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit

class GithubDetailDefaultRouter : GithubDetailRouter {
    
    static func getDetailViewController() -> UIViewController? {
        guard let detailVC = GithubDetailDefaultRouter.initializeViewController() as? GithubDetailViewContorller else { return nil }
        return detailVC
    }

}

extension GithubDetailDefaultRouter : Initializable {}
