//
//  GithubListReducer.swift
//  sw-viperx
//
//  Created by Amir on 07/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

func githubListReducer(action : Action, state : GithubListState?) -> GithubListState {
    
    var state = state ?? GithubListState(list: [], error: nil)
    
    switch action {
    case let listAction as GithubListAction:
        switch listAction {
        case .success(let data):
            state.list = data
        case .failure(let error):
            state.error = error
        }
    default:
        break
    }
    
    return state
}
