//
//  CJTabBar.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/13.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CJTabBar: UITabBar {
    
    var centerBut:UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tintColor = CJTool.ColorHex("#f85959")

        centerBut = UIButton(type: .custom)
        centerBut?.setImage(UIImage(named: "redpackage_tabbar_32x32_"), for: .normal)
        centerBut?.addTarget(self, action: #selector(centerButClick(button:)), for: .touchUpInside)
        self.addSubview(centerBut!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.frame.width;
        let height = self.frame.height;
        
        // 设置发布按钮的
        centerBut!.frame = CGRect(x: 0, y: 0, width: width / 5, height: height)
        centerBut!.center = CGPoint(x: width * 0.5, y: height * 0.5)
        //
        
        // 设置其他UITabBarButton的frame
        let buttonW = width / 5;
        
        var index:CGFloat = 0.0
        for button in self.subviews {
            if (!button.isKind(of: UIControl.self) || button == centerBut ) {
                continue
            }
            // 计算按钮的x值
            let buttonX = buttonW * ((index > 1) ? (index + 1) : index);
            button.frame = CGRect(x:buttonX, y: 0, width: width / 5, height: height)
            
            index+=1
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func centerButClick(button: UIButton) {
        self.window?.rootViewController?.present(CJPushController(), animated: true, completion: nil)
    }
    
}
