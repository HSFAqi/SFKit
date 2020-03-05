//
//  ViewController.swift
//  SFKit
//
//  Created by hsfiOSGitHub on 03/04/2020.
//  Copyright (c) 2020 hsfiOSGitHub. All rights reserved.
//

import UIKit
import SFKit

let screenW: CGFloat = UIScreen.main.bounds.size.width
let screenH: CGFloat = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    let space: CGFloat = 20
    let scale: CGFloat = 3/5
    var items = [String]()
    var collectionView: SFManagerCollectionView! {
        didSet{
            collectionView.clipsToBounds = false
            collectionView.backgroundColor = UIColor.white
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.register(UINib.init(nibName: String(describing: TestCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TestCell.self))
            collectionView.alwaysBounceVertical = (collectionView.direction == .vertical)
            collectionView.alwaysBounceHorizontal = (collectionView.direction == .horizontal)
            collectionView.responseEvent = { [weak self]
                (collectionView, collectionViewCell, indexPath) in
                let idx = indexPath ?? IndexPath(row: 0, section: 0)
                if #available(iOS 9.0, *) {
                    collectionView.beginInteractiveMovementForItem(at: idx)
                } else {
                    // Fallback on earlier versions
                }
                self?.items.remove(at: idx.row)
                collectionView.deleteItems(at: [idx])
                if #available(iOS 9.0, *) {
                    collectionView.endInteractiveMovement()
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    func horizontalDemo() {
        if let c = collectionView, self.view.subviews.contains(c) {
            c.removeFromSuperview()
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        let w = (screenW-space*3)/2
        let h = w / scale
        layout.itemSize = CGSize(width: w, height: h)
        let collect = SFManagerCollectionView(frame: CGRect(x: 0, y: screenH-(h+space*2), width: screenW, height: h+space*2), collectionViewLayout: layout)
        collect.direction = .horizontal
        collectionView = collect
        self.view.addSubview(collectionView)
    }
    func verticalDemo() {
        if let c = collectionView, self.view.subviews.contains(c) {
            c.removeFromSuperview()
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        let w = (screenW-space*3)/2
        let h = w / scale
        layout.itemSize = CGSize(width: w, height: h)
        let collect = SFManagerCollectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH), collectionViewLayout: layout)
        collect.direction = .vertical
        collectionView = collect
        self.view.addSubview(collectionView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for idx in 0...11 {
            self.items.append("\(idx)")
        }
        horizontalDemo()
        //verticalDemo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TestCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TestCell.self), for: indexPath) as! TestCell
        let image = UIImage(named: items[indexPath.row])
        let w = (screenW-space*3)/2
        let h = w / scale
        cell.imgView.image = image?.setCorner(radius: 10, rect: CGRect(x: 0, y: 0, width: w, height: h))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}
extension ViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (screenW-space*3)/2
        let h = w / scale
        return CGSize(width: w, height: h)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: space, bottom: space, right: space)
    }
}
