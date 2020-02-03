//
//  GithubItem+CoreDataProperties.swift
//  sw-viperx
//
//  Created by Amir on 11/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//
//

import Foundation
import CoreData


extension GithubItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GithubItem> {
        return NSFetchRequest<GithubItem>(entityName: "GithubItem")
    }

    @NSManaged public var category: String?
    @NSManaged public var details: String?
    @NSManaged public var name: String?

}
