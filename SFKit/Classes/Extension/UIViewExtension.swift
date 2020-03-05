//
//  UIViewExtension.swift
//  SwiftTestDemo
//
//  Created by 黄山锋 on 2020/3/5.
//  Copyright © 2020 SFTeam. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    /// 设置阴影
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - opacity: 不透明度
    ///   - radius: 半径
    ///   - offset: 偏移
    ///
    /// 使用shadowPath，避免离屏渲染。
    func setShadow(color: UIColor, opacity: Float, radius: CGFloat, offset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        let path = UIBezierPath(rect: bounds)
        layer.shadowPath = path.cgPath
    }
    
    /// 设置圆角
    /// - Parameter radius: 圆角半径
    ///
    /// UIView(不包括子类)、UILabel、UITextField、UITextView，UIButton，直接使用layer.cornerRadius 一行代码就行。避免离屏渲染。
    @objc func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    
}

