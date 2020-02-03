//
//  Extensions.swift
//  sw-viperx
//
//  Created by Amir on 04/11/2018.
//  Copyright © 2018 Venturedive. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String? = nil, and message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)

    }

    func startActivityIndicator(
        style: UIActivityIndicatorViewStyle = .gray,
        location: CGPoint? = nil) {

        //Set the position - defaults to `center` if no`location`

        //argument is provided

        let loc = location ?? self.view.center

        //Ensure the UI is updated from the main thread

        //in case this method is called from a closure

        DispatchQueue.main.async {

            //Create the activity indicator

            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            //Add the tag so we can find the view in order to remove it later

            activityIndicator.tag = 101
            //Set the location

            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            //Start animating and add the view

            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }

    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter({ $0.tag == 101}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}

extension UIView {
    func showBlurLoader() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()

        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center

        self.addSubview(blurEffectView)
    }

    func removeBluerLoader() {
        self.subviews.compactMap {  $0 as? UIVisualEffectView }.forEach {
            $0.removeFromSuperview()
        }
    }
}
