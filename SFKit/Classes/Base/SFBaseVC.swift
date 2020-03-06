//
//  SFBaseVC.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/6.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

open class SFBaseVC: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.viewBackgroundColor
    }
    open override var hidesBottomBarWhenPushed: Bool{
        willSet{
            if newValue {
                self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: customBackIcon(), style: .plain, target: self, action: #selector(goback(_:)))
            }
        }
    }
    /// 重写该方法来自定义返回icon
    open func customBackIcon() -> UIImage? {
        return UIImage.bundleImageWithName("back")
    }
    /// 返回
    @objc open func goback(_ animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
