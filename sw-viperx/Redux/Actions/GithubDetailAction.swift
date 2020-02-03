//
//  GithubDetailAction.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

enum GithubDetailAction: Action {
    case success(GithubDetailViewModel)
    case failure(String)
}
