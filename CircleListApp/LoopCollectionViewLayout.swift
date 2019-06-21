//
//  LoopCollectionViewLayout.swift
//  CircleListApp
//
//  Created by sn0008 on 2019/06/21.
//  Copyright © 2019 sn0008. All rights reserved.
//

import UIKit

class LoopCollectionViewLayout: UICollectionViewLayout {
    
    //元素尺寸
    var itemSize:CGFloat = 60.0
    //元素个数
    fileprivate var _itemCount:Int?
    //整个collection view视图尺寸
    fileprivate var _viewSize:CGSize?
    //整个collection view视图中心点位置
    fileprivate var _center:CGPoint?
    //圆环路径的半径
    fileprivate var _radius:CGFloat?
    
    fileprivate var insertIndexPaths = [IndexPath]()
    
    //设定一些必要的layout的结构和初始需要的参数
    override func prepare() {
        super.prepare()
        _viewSize = self.collectionView?.frame.size
        _itemCount = self.collectionView?.numberOfItems(inSection: 0)
        _center = CGPoint(x: _viewSize!.width / 2.0, y: _viewSize!.height / 2.0)
        _radius = (min(_viewSize!.width, _viewSize!.height) - itemSize) / 2
    }
    
    //所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
            var attributesArray = [UICollectionViewLayoutAttributes]()
            if let count = self._itemCount {
                for i in 0 ..< count{
                    //这里利用layoutAttributesForItem方法来获取attributes
                    let indexPath = IndexPath(item: i, section: 0)
                    let attributes =  self.layoutAttributesForItem(at: indexPath)
                    attributesArray.append(attributes!)
                }
            }
            return attributesArray
    }
    
    //这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
            let attrs = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attrs.size = CGSize(width: itemSize, height: itemSize)
            let x = Double(_center!.x) + Double(_radius!) * cos(Double(2 * indexPath.item) * M_PI/Double(_itemCount!))
            let y = Double(_center!.y) + Double(_radius!) * sin(Double(2 * indexPath.item) * M_PI/Double(_itemCount!))
            attrs.center = CGPoint(x: CGFloat(x), y: CGFloat(y))
            return attrs
    }

}
