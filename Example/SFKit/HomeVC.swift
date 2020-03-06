//
//  HomeVC.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/7.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SFKit

class HomeVC: SFBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我和我的祖国"
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = UIColor.cyan
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnEvent), for: .touchUpInside)
    }
    @objc func btnEvent() {
        let vc = HomeVC()
        vc.view.backgroundColor = UIColor.orange
        navigationController?.pushViewController(vc, animated: true)
    }

}
