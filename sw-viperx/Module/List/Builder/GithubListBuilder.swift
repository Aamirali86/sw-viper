//
//  GithubListBuilder.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit
import Swinject

protocol GithubListBuilder {
    func buildGithubListModule(resolver: Resolver, vc: UIViewController)
}
