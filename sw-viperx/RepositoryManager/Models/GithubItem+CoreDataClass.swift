//
//  GithubItem+CoreDataClass.swift
//  sw-viperx
//
//  Created by Amir on 11/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GithubItem)
public class GithubItem: NSManagedObject {
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(model : GithubListViewModel , context : NSManagedObjectContext) {
        let entityDesc = NSEntityDescription.entity(forEntityName: "GithubItem", in: context)
        super.init(entity: entityDesc!, insertInto: context)
        
        self.name = model.name
        self.details = model.description
        self.category = model.language
    }

}
