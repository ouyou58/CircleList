//
//  ViewController.swift
//  CircleListApp
//
//  Created by sn0008 on 2019/06/21.
//  Copyright © 2019 sn0008. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    

    @IBOutlet weak var collectView: UICollectionView!
    
    var loopLayout:LoopCollectionViewLayout!
    var images = ["c#.png", "html.png", "java.png", "js.png", "php.png",
                  "react.png", "ruby.png", "swift.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initCollectionView()
        let nib = UINib.init(nibName: "MyCollectionViewCell", bundle: Bundle.main)
        collectView.register(nib, forCellWithReuseIdentifier: "myCell")
        
    }
    
    func initCollectionView(){

        loopLayout = LoopCollectionViewLayout()
        collectView.collectionViewLayout = loopLayout
        collectView.delegate = self
        collectView.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath) //当点击某个cell时要做的处理
    }

}

