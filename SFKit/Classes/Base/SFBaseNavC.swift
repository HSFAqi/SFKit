//
//  SFBaseNavC.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/7.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

open class SFBaseNavC: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.viewBackgroundColor
        navigationBar.barTintColor = UIColor.navBarTintColor
        navigationBar.tintColor = UIColor.navTintColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navTitleColor, NSAttributedString.Key.font: UIFont.h1]
    }

    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
