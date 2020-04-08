//
//  CJNetWorkTool.swift
//  Swift1
//
//  Created by 王景伟 on 2019/6/11.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Alamofire

protocol CJNetWorkToolProtocol  {
    
    // MARK: 首页顶部新闻标题的数据
    static func loadHomeNewsTitleData(complete: @escaping (_ isSuccess:Bool, _ newsTitles:[HomeNewsTitle]) -> ())
    
    // MARK: 点击+号请求的数据
    static func loadHomeCategoryRecommend(complete: @escaping (_ titles: [HomeNewsTitle]) -> ())

    // MARK: 首页顶部导航栏搜索推荐标题内容
    static func loadHomeSearchRecommendStr(complete: @escaping (_ recommendStr: String) -> ())
    
    // MARK:获取首页、视频、小视频的新闻列表数据
    //static func loadNewsFeeds(category: NewsTitleCategory, ttFrom: TTFrom, _ completionHandler: @escaping (_ maxBehotTime: TimeInterval, _ news: [NewsModel]) -> ())
    
    
}

extension CJNetWorkToolProtocol {
    static func loadHomeNewsTitleData(complete: @escaping (_ isSuccess:Bool, _ newsTitles:[HomeNewsTitle]) -> ()) {
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
                    } else {
                        complete(false,[HomeNewsTitle]())
                    }
                } else {
                    complete(false,[HomeNewsTitle]())
                }
            } else {
                complete(false,[HomeNewsTitle]())
            }
        }
    }
    static func loadHomeCategoryRecommend(complete: @escaping ([HomeNewsTitle]) -> ()) {
        
    }
    
    static func loadHomeSearchRecommendStr(complete: @escaping (String) -> ()) {
        
    }
}


struct CJNetWorkTool: CJNetWorkToolProtocol {

}

