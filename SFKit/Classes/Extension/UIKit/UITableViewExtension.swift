//
//  UITableViewExtension.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/5.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    /// 安全滚动到指定的section，row
    func scrollTo(row: Int, section: Int, position: ScrollPosition, animated: Bool) {
        let indexPath = IndexPath(row: row, section: section)
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: position, animated: animated)
    }
}

// MARK: - CURD
extension UITableView {
    /// 插入row
    func insertRow(_ row: Int, inSection section: Int, animation: RowAnimation) {
        let indexPath = IndexPath(row: row, section: section)
        insertRows(at: [indexPath], with: animation)
    }
    
    /// 删除row
    func deleteRow(_ row: Int, inSection section: Int, animation: RowAnimation) {
        let indexPath = IndexPath(row: row, section: section)
        deleteRows(at: [indexPath], with: animation)
    }
    
    /// 更新row
    func reloadRow(_ row: Int, inSection section: Int, animation: RowAnimation) {
        let indexPath = IndexPath(row: row, section: section)
        reloadRows(at: [indexPath], with: animation)
    }
    
    /// 插入section
    func insertSection(_ section: Int, animation: RowAnimation) {
        let sections = IndexSet(integer: section)
        insertSections(sections, with: animation)
    }
    
    /// 删除section
    func deleteSection(_ section: Int, animation: RowAnimation)  {
        let sections = IndexSet(integer: section)
        deleteSections(sections, with: animation)
    }
    
    /// 更新section
    func reloadSection(_ section: Int, animation: RowAnimation)  {
        let sections = IndexSet(integer: section)
        reloadSections(sections, with: animation)
    }
}
