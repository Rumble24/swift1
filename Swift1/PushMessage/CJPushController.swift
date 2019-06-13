//
//  CJPushController.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/12.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

class CJPushController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.dismiss(animated: true, completion: nil)
    }

}
