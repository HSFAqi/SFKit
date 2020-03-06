//
//  UIScrollViewExtension.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/6.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - scrollAction
public extension UIScrollView {
    /// 滚动到最顶部
    func scrollToTop(animated: Bool = true) {
        var offset = contentOffset
        offset.y = 0 - contentInset.top
        setContentOffset(offset, animated: animated)
    }
    
    /// 滚动到最底部
    func scrollToBottom(animated: Bool = true) {
        var offset = contentOffset;
        offset.y = contentSize.height - bounds.size.height + contentInset.bottom;
        setContentOffset(offset, animated: animated)
    }
    
    /// 滚动到最左侧
    func scrollToLeft(animated: Bool = true) {
        var offset = contentOffset;
        offset.x = 0 - contentInset.left;
        setContentOffset(offset, animated: animated)
    }
    
    /// 滚动到最右左侧
    func scrollToRight(animated: Bool = true) {
        var offset = contentOffset;
        offset.x = contentSize.width - bounds.size.width + contentInset.right;
        setContentOffset(offset, animated: animated)
    }
}

// MARK: - func
extension UIScrollView {
    /// 快照
    var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(contentSize, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        let previousFrame = frame
        frame = CGRect(origin: frame.origin, size: contentSize)
        layer.render(in: context)
        frame = previousFrame
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
