//
//  ListViewModel.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ObjectMapper

struct GithubListViewModel: Mappable, Equatable {
    var name: String?
    var description: String?
    var language: String?

    init?(map: Map) {}

    init(name: String, detail: String, category: String) {
        self.name = name
        description = detail
        language = category
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        language <- map["language"]
    }

}

struct GithubListMapper: ResponseMapper {
    typealias response = GithubListViewModel

    static func map(data: Any) throws -> [GithubListViewModel] {
        let listJSON = data as! [[String: Any]]
        let data = Mapper<GithubListViewModel>().mapArray(JSONArray: listJSON)

        return data
    }

}
