//
//  GithubListRepository.swift
//  sw-viperx
//
//  Created by Amir on 05/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import UIKit

class GithubListRepository : Repository {
    var dbManager : CoreDataManager
    var entityName : String
    
    required init(dbManager : CoreDataManager, entityName : String) {
        self.dbManager = dbManager
        self.entityName = entityName
    }
    
    func fetch(by predicate: NSPredicate? = nil) -> [GithubListViewModel] {
        var items: [GithubListViewModel] = []
        
        if let result = dbManager.fetchObjects(entityName, predicate: predicate) as? [GithubItem] {
            result.forEach { item in
                let model = GithubListViewModel(name: item.name ?? "", detail: item.details ?? "", category: item.category ?? "")
                items.append(model)
            }
        }
        
        return items
    }
    
    func fetchAll() -> [GithubListViewModel] {
        return self.fetch()
    }
    
    func save(_ object: GithubListViewModel) {
        let _ = GithubItem(model: object, context: dbManager.context)
        dbManager.saveContext()
    }
    
    func save(_ objects: [GithubListViewModel]) {
        for object in objects {
            let _ = GithubItem(model: object, context: dbManager.context)
        }
        dbManager.saveContext()
    }
    
    func update(_ object: GithubListViewModel) {
        
        if let dataModel = dbManager.getEntityIfExist(entityName) as? GithubItem {
            dataModel.name = object.name
            dataModel.details = object.description
            dataModel.category = object.language
            
            dbManager.saveContext()
        }

    }
    
    func delete(by predicate: NSPredicate? = nil) {
        dbManager.deleteObjects(entityName, predicate: predicate)
    }
    
    func deleteAll() {
        self.delete()
    }
    
}
