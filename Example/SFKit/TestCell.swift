//
//  TestCell.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/4.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TestCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
