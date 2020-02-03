//
//  Repository.swift
//  sw-viperx
//
//  Created by Amir on 05/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

protocol ReadableDatabase: class {
    associatedtype E
    func fetch(by predicate: NSPredicate?) -> [E]
    func fetchAll() -> [E]
}

protocol WriteableDatabase: class {
    associatedtype E
    func save(_ object: E)
    func save(_ objects: [E])
    func update(_ object: E)
    func delete(by predicate: NSPredicate?)
    func deleteAll()
}

typealias Repository = ReadableDatabase & WriteableDatabase
