//
//  DetailViewController.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import UIKit

class GithubDetailViewContorller : UIViewController, GithubDetailView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var model:GithubListViewModel?
    var presenter : GithubDetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = model?.name
        
        if model != nil {
            presenter?.loadContent(with: model!)
        }
    }
    
    func displayDetailView(data: GithubDetailViewModel) {
        name.text = data.name
        fullname.text = data.fullname
        desc.text = data.description
    }
    
    func displayError(errorMessage: String) {
        showAlert(and: errorMessage)
    }
    
}
