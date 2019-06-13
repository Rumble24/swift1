//
//  CJXiGuaController.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/12.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CJXiGuaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }


}

extension CJXiGuaController {
    private func configUI() {
        navigationItem.title = "西瓜视频"
        view.backgroundColor = UIColor.white
    }
}
