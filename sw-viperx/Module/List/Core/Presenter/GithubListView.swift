//
//  ListView.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

protocol GithubListView : class {
    func displayList(datasource: [GithubListViewModel])
    func displayError(errorMessage : String)
}
