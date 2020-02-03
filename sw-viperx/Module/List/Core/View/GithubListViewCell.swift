//
//  ListViewCell.swift
//  sw-viperx
//
//  Created by Amir on 03/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit

class GithubListViewCell : UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var category: UILabel!
    
    func setupCell(_ data: GithubListViewModel) {
        name.text = data.name
        details.text = data.description
        category.text = data.language
    }
}
