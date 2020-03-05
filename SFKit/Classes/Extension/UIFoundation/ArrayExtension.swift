//
//  ArrayExtension.swift
//  DynamicDemo
//
//  Created by 黄山锋 on 2019/10/10.
//  Copyright © 2019 黄山锋. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: Hashable{
    
    /// 数组去重
    var unique:[Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
    
}

extension Array {
    /// EZSE: Returns an array with the given number as the max number of elements.
    public func takeMax(_ n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }
}
