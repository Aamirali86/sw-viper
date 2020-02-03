//
//  GithubDetailView.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

protocol GithubDetailView: class {
    func displayDetailView(data: GithubDetailViewModel)
    func displayError(errorMessage: String)
}
