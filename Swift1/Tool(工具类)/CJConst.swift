//
//  CJConst.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit

/// 屏幕的宽度
let screenW = UIScreen.main.bounds.width
/// 屏幕的高度
let screenH = UIScreen.main.bounds.height

let navH:CGFloat = UIApplication.shared.statusBarFrame.height >= 44.0 ? 88.0 : 64.0

let contentH = screenH - navH

let BASE_URL = "https://is.snssdk.com"

let device_id: Int = 6096495334

let iid: Int = 5034850950


/// 从哪里进入头条
enum TTFrom: String {
    case pull = "pull"
    case loadMore = "load_more"
    case auto = "auto"
    case enterAuto = "enter_auto"
    case preLoadMoreDraw = "pre_load_more_draw"
}
