//
//  ListServiceBuilder.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Swinject

class GithubListServiceBuilder {
    func build() -> GithubListService {
        return Container.sharedContainer.resolve(GithubListService.self)!
    }
}
