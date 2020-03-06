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
}

// MARK: - CURD
extension UICollectionView {
    /// 插入item
    func insertItem(_ row: Int, inSection section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        insertItems(at: [indexPath])
    }
    
    /// 删除item
    func deleteItem(_ row: Int, inSection section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        deleteItems(at: [indexPath])
    }
    
    /// 更新item
    func reloadItem(_ row: Int, inSection section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        reloadItems(at: [indexPath])
    }
    
    /// 插入section
    func insertSection(_ section: Int) {
        let sections = IndexSet(integer: section)
        insertSections(sections)
    }
    
    /// 删除section
    func deleteSection(_ section: Int)  {
        let sections = IndexSet(integer: section)
        deleteSections(sections)
    }
    
    /// 更新section
    func reloadSection(_ section: Int)  {
        let sections = IndexSet(integer: section)
        reloadSections(sections)
    }
}
