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

    class func loadHomeNewsTitleData() {
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id,"iid": iid]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode : [200]).response(queue: DispatchQueue.global()) { (responseData) in
            if let data = responseData.data {
                guard let jsonString = String(bytes: data, encoding: .utf8) else { return }
                print(jsonString)
            } else {
                print(responseData.error)
            }
        }
        
        
    }
}
