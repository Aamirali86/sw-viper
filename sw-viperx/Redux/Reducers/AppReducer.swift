//
//  AppReducer.swift
//  sw-viperx
//
//  Created by Amir on 07/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action : Action, state : AppState?) -> AppState {
    return AppState(
        listState: githubListReducer(action: action, state: state?.listState),
        detailState: githubDetailReducer(action: action, state: state?.detailState)
    )
}
