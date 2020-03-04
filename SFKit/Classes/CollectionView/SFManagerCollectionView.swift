//
//  SFManagerCollectionView.swift
//  SFKit_Example
//
//  Created by 黄山锋 on 2020/3/4.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

public class SFManagerCollectionView: UICollectionView {
    
    public var direction: UICollectionView.ScrollDirection = .vertical
    private(set) var movingCell: UICollectionViewCell?
    private(set) var movingCellCenter: CGPoint?
    private(set) var beginPoint: CGPoint?
    private(set) var movingPoint: CGPoint?
    private(set) var movingIndexPath: IndexPath?
    private(set) var isMoving: Bool = false
    private(set) var isShouldResponse: Bool = false
    public var responseDistance: CGFloat = 100
    public var responseEvent: ((SFManagerCollectionView, UICollectionViewCell?, IndexPath?) -> Void)?
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addPanGesture()
    }
    /// 添加手势
    private func addPanGesture() {
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panEvent))
        self.superview?.isUserInteractionEnabled = true
        self.superview?.addGestureRecognizer(pan)
    }
    @objc private func panEvent(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            let point = pan.location(in: pan.view)
            var x: CGFloat = 0
            var y: CGFloat = 0
            if direction == .vertical {
                x = point.x
                y = point.y+contentOffset.y
            }else{
                x = point.x+contentOffset.x
                y = point.y
            }
            beginPoint = CGPoint(x: x, y: y)
            movingIndexPath = indexPathForItem(at: beginPoint!)
            movingCell = cellForItem(at: movingIndexPath ?? IndexPath(row: 0, section: 0))
            movingCellCenter = movingCell?.center
            break
        case .changed:
            let point = pan.location(in: pan.view)
            var x: CGFloat = 0
            var y: CGFloat = 0
            if direction == .vertical {
                x = point.x
                y = point.y+contentOffset.y
            }else{
                x = point.x+contentOffset.x
                y = point.y
            }
            movingPoint = CGPoint(x: x, y: y)
            let detaX = (direction == .vertical) ? (movingPoint!.x - beginPoint!.x) : (movingPoint!.y - beginPoint!.y);
            if abs(detaX) >= responseDistance {
                isShouldResponse = true
            }else{
                isShouldResponse = false
            }
            var center: CGPoint
            if direction == .vertical {
                center = CGPoint(x: (movingCellCenter?.x ?? 0)+detaX, y: (movingCellCenter?.y ?? 0))
            }else{
                center = CGPoint(x: (movingCellCenter?.x ?? 0), y: (movingCellCenter?.y ?? 0)+detaX)
            }
            movingCell?.center = center
            break
        case .ended:
            if isShouldResponse {
                if let block = responseEvent {
                    block(self, movingCell, movingIndexPath)
                }
            }else{
                movingCell?.center = movingCellCenter!
            }
            break
        default:
            break
        }
    }
}
