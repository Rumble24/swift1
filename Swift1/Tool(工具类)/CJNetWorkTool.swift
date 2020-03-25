//
//  CJNetWorkTool.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/11.
//  Copyright © 2019 王景伟. All rights reserved.
//

import UIKit
import Alamofire

class CJNetWorkTool: NSObject {

    class func loadHomeNewsTitleData(complete: @escaping (_ isSuccess:Bool, _ newsTitles:[HomeNewsTitle]) -> ()) {
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id,"iid": iid]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                complete(false,[HomeNewsTitle]())
                return
            }
            
            if let jsonString = response.result.value {
                //将返回的JSON数据转换成AjaxResult模型的数据并将AjaxResult对象传回
                if let obj = HomeNews.deserialize(from: jsonString as? Dictionary) {
                    if obj.message == "success" {
                        if let NewsData = obj.data {
                            complete(true,NewsData.data)
                        } else {
                            complete(false,[HomeNewsTitle]())
                        }
                    }
                } else {
                    complete(false,[HomeNewsTitle]())
                }
            } else {
                complete(false,[HomeNewsTitle]())
            }
        }  
    }
}
