//
//  BaseRouter.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit
import SwinjectStoryboard
import Swinject

class BaseRouter {
    weak var window: UIWindow?
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        createBaseRoute()
    }
    
    func createBaseRoute() {
        presentListViewController()
    }
    
    fileprivate func presentListViewController() {
        guard let listVC = GithubListDefaultRouter.getListViewController() else { return }
        
        navigationController.viewControllers = [listVC]
        self.window?.rootViewController = navigationController
    }
    
}

extension UIStoryboard {
    enum Name:String {
        case main = "Main"
    }
}

protocol Initializable {
    static var storyboardName: String { get }
}

extension Initializable {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName: String {
        return UIStoryboard.Name.main.rawValue
    }
    
    static func initializeViewController() -> UIViewController {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        let instance = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
//        return instance
        
        let sb = SwinjectStoryboard.create(name: storyboardName, bundle: nil, container: Container.sharedContainer)
        let instance = sb.instantiateViewController(withIdentifier: storyboardIdentifier)
        return instance
    }
}
