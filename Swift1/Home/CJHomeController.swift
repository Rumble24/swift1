//
//  CJHomeController.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CJHomeController: UIViewController {
 
    var collection:UICollectionView?
    
    var data = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        createCollectionView()
        
        requestData()
    }

}

extension CJHomeController {
    private func configUI() {
        self.navigationItem.title = "首页"
        self.view.backgroundColor = UIColor.white
    }
    
    private func requestData() {
        CJNetWorkTool.loadHomeNewsTitleData()
    }
}

extension CJHomeController: UICollectionViewDelegate,UICollectionViewDataSource {
    
     private func createCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenW, height: contentH), collectionViewLayout: layout)
        collection?.delegate = self
        collection?.dataSource = self
        collection?.backgroundColor = UIColor.white
        collection?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.view.addSubview(collection!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.label?.text = "222"
        return cell
    }
}

