//
//  UIImageExtension.swift
//  SwiftTestDemo
//
//  Created by 黄山锋 on 2020/3/5.
//  Copyright © 2020 SFTeam. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
    /// 给图片添加圆角
    /// - Parameter radius: 圆角半径
    ///
    /// 可以避免离屏渲染
    func setCorner(radius: CGFloat, rect: CGRect?) -> UIImage? {
        let r = rect ?? CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let path = UIBezierPath(roundedRect: r, cornerRadius: radius)
        UIGraphicsBeginImageContextWithOptions(r.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context!.addPath(path.cgPath)
        context!.clip()
        draw(in: r)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
