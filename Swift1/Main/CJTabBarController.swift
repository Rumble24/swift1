//
//  CJTabBarController.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/12.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = CJTool.ColorHex("#f85959")

        self.addChildControllerForTabBar(vc: CJHomeController(), title: "首页", imageName: "home")
        self.addChildControllerForTabBar(vc: CJXiGuaController(), title: "西瓜视频", imageName: "video")
        self.addChildControllerForTabBar(vc: CJSmallVideoController(), title: "小视频", imageName: "weitoutiao")
        self.addChildControllerForTabBar(vc: CJMineController(), title: "我的", imageName: "mine")
    }
    
    func addChildControllerForTabBar(vc:UIViewController,title:String,imageName:String) -> Void {
        let naVC = CJNavigationController(rootViewController: vc)
        naVC.tabBarItem.title = title
        naVC.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        naVC.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
        self.addChild(naVC)
    }
    
}
