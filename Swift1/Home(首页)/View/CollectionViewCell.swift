//
//  CollectionViewCell.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var label:UILabel?
    
    var model = HomeNewsTitle() {
        didSet {
            label?.text = model.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        label = UILabel.init()
        label?.font = UIFont.systemFont(ofSize: 14)
        label?.textAlignment = .center
        
        self.backgroundColor = UIColor.lightGray
        
        self.addSubview(label!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        label?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
    }
}
