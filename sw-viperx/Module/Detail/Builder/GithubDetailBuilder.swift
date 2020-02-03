//
//  GithubDetailBuilder.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Swinject
import UIKit

protocol GithubDetailBuilder {
    func buildGithubDetailModule(resolver: Resolver, vc: UIViewController)
}
