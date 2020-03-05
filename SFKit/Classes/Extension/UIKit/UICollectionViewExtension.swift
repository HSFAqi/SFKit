//
//  UICollectionViewExtension.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/5.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    /// 安全滚动到指定的section，item
    func scrollTo(item: Int, section: Int, position: ScrollPosition, animated: Bool) {
        let indexPath = IndexPath(item: item, section: section)
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfItems(inSection: indexPath.section) else { return }
        scrollToItem(at: indexPath, at: position, animated: animated)
    }
    
    /// 滚动到顶部
    func scrollToTop(position: ScrollPosition, animated: Bool) {
        scrollTo(item: 0, section: 0, position: position, animated: animated)
    }
    
    /// 滚动到底部
    func scrollToBottom(position: ScrollPosition, animated: Bool) {
        scrollTo(item: numberOfItems(inSection: numberOfSections), section: numberOfSections, position: position, animated: animated)
    }
}
