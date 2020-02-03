//
//  CoreDataManager.swift
//  sw-viperx
//
//  Created by Amir on 05/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    var context : NSManagedObjectContext!
    
    init(context : NSManagedObjectContext) {
        self.context = context
    }

    // MARK: - Core Data Saving support
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchObjects(_ entity : String, predicate : NSPredicate? = nil) -> [NSManagedObject]? {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        var result:[NSManagedObject]?
        
        if predicate != nil {
            fetchRequest.predicate = predicate
        }
        
        do {
            result = try context.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return result
    }
    
    func deleteObjects(_ entity : String ,  predicate : NSPredicate? = nil) {
        let data = fetchObjects(entity, predicate: predicate)
        
        if let dataToDelete = data {
            dataToDelete.forEach({ (_data) in
                context.delete(_data)
            })
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getEntityIfExist(_ entity : String, predicate : NSPredicate? = nil) -> NSManagedObject? {
        let data = fetchObjects(entity, predicate: predicate)
        var object : NSManagedObject? = nil
        if let _data = data {
            object = (_data.count <= 0) ? data?.first : nil
        }
        return object
    }

}

