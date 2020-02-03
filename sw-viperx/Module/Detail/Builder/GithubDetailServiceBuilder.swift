//
//  GithubDetailServiceBuilder.swift
//  sw-viperx
//
//  Created by Amir on 08/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation
import Swinject

class GithubDetailServiceBuilder {
    func build() -> GithubDetailService {
        return Container.sharedContainer.resolve(GithubDetailService.self)!
    }
}
