//
//  UIViewControllerExtension.swift
//  DynamicDemo
//
//  Created by 黄山锋 on 2019/10/10.
//  Copyright © 2019 黄山锋. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    /// 最顶端控制器(类属性)
    class var current: UIViewController? {
        var vc: UIViewController?
        vc = Self.getTopLevelViewController(UIApplication.shared.keyWindow?.rootViewController)
        while vc?.presentedViewController != nil {
            vc = Self.getTopLevelViewController(vc?.presentedViewController)
        }
        return vc
    }
    
    /// 最顶端控制器(对象属性)
    var current: UIViewController? {
        var vc: UIViewController?
        vc = Self.getTopLevelViewController(UIApplication.shared.keyWindow?.rootViewController)
        while vc?.presentedViewController != nil {
            vc = Self.getTopLevelViewController(vc?.presentedViewController)
        }
        return vc
    }
    
    /// 递归调用获取最顶部的控制器
    /// - Parameter vc: 控制器
    private class func getTopLevelViewController(_ vc: UIViewController?) -> UIViewController? {
        if vc is UINavigationController {
            return getTopLevelViewController((vc as? UINavigationController)?.topViewController)
        } else if vc is UITabBarController {
            return getTopLevelViewController((vc as? UITabBarController)?.selectedViewController)
        } else {
            return vc
        }
    }
}
