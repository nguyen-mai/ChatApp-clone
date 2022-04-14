//
//  Extensions.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/8.
//

import Foundation
import UIKit

extension UIColor {
    static let mainColor = UIColor(red: 91.0/255.0, green: 113.0/255.0, blue: 226.0/255.0, alpha: 1)
    static let lightGrayColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 202.0/255.0)
}

extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
