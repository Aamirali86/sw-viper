//
//  UserDefaultsManager.swift
//  sw-viperx
//
//  Created by Amir on 05/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import Foundation

class UserDefaultManager: NSObject {

    static let sharedInstance: UserDefaultManager = UserDefaultManager()
    private let userDefaults: UserDefaults

    private override init() {
        self.userDefaults = UserDefaults.standard
    }

    func setLastUpdateTime(key: String) {
        self.userDefaults.set(Date(), forKey: key)
    }

    func getLastUpdatedTime(key: String) -> Date? {
        return self.userDefaults.object(forKey: key) as? Date
    }

    func setGithubListLastUpdateTime() {
        self.userDefaults.set(Date(), forKey: Constants.GITHUBLIST_LAST_UPDATED_TIME)
    }

    func getGithubListLastUpdatedTime() -> Date? {
        return self.userDefaults.object(forKey: Constants.GITHUBLIST_LAST_UPDATED_TIME) as? Date
    }

    func removeGithubListLastUpdatedTime() {
        self.userDefaults.set(nil, forKey: Constants.GITHUBLIST_LAST_UPDATED_TIME)
    }

}
