//
//  GithubListState.swift
//  sw-viperx
//
//  Created by Amir on 07/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

struct GithubListState : StateType {
    var list:[GithubListViewModel]
    var error: String?
}
