//
//  ListViewController.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import UIKit

class GithubListViewController : UIViewController, GithubListView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var datasource: [GithubListViewModel]?
    var presenter : GithubListPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        startActivityIndicator()
        presenter?.loadContent()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: String(describing: GithubListViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GithubListViewCell.self))
    }
    
    func displayList(datasource: [GithubListViewModel]) {
        stopActivityIndicator()
        self.datasource = datasource
        tableView.reloadData()
    }
    
    func displayError(errorMessage: String) {
        stopActivityIndicator()
        showAlert(and: errorMessage)
    }
    
}

extension GithubListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = datasource?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GithubListViewCell") as? GithubListViewCell {
            cell.setupCell(datasource![indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentDetailView(datasource![indexPath.row])
    }
}
