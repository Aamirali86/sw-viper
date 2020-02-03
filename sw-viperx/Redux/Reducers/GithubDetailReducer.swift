//
//  GithubDetailReducer.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

func githubDetailReducer(action : Action, state : GithubDetailState?) -> GithubDetailState {
    
    var state = state ?? GithubDetailState(model: nil, error: nil)
    
    switch action {
    case let detailAction as GithubDetailAction:
        handleAction(action : detailAction, state: &state)
    default:
        break
    }
    
    return state
}

private func handleAction(action: GithubDetailAction, state : inout GithubDetailState) {
    switch action {
    case .success(let data):
        state.model = data
    case .failure(let error):
        state.error = error
    }
    
}
