//
//  GithubDetailViewModel.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import ObjectMapper

struct GithubDetailViewModel: Mappable {
    var name: String?
    var fullname: String?
    var description: String?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        fullname <- map["full_name"]
        description <- map["description"]
    }

}

struct GithubDetailMapper: ResponseMapper {
    typealias response = GithubDetailViewModel

    static func map(data: Any) throws -> [GithubDetailViewModel] {
        let detailJSON = data as! [String: Any]
        let data = Mapper<GithubDetailViewModel>().map(JSON: detailJSON)
        return [data!]
    }

}
