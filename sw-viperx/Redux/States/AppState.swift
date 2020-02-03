//
//  AppState.swift
//  sw-viperx
//
//  Created by Amir on 07/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    let listState: GithubListState
    let detailState: GithubDetailState
}
