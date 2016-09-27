//
//  CarModelNetWork.swift
//  CarModel
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import Foundation

extension CarModel{

    class func requestData(Page page:NSInteger,callBack:(array:[AnyObject]?,error:NSError?) -> Void) -> Void{
        
        let url = "http://app.api.niuche.com/modi/mix_list?"
        let dic = ["page":String(page),"count":"20"]
        BaseRequest.getWithURL(url, para: dic) { (data, error) in
            if error == nil{
//                let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
//                print(str!)
                
                let models = NSMutableArray()
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let dataArr = obj["data"] as! [[String:AnyObject]]
                for dic in dataArr{
                    let type = String(dic["type"] as! NSNumber)
//                    print("type = \(type)")
                    if type == "1"{ // 作品
                        let model = CarModel()
                        model.type = dic["type"] as? NSNumber
                        let dict = dic["modi_case"] as! [String:AnyObject]
                        model.city_name = dict["city_name"] as? String
                        model.cover = dict["cover"] as? String
                        model.favor_num = dict["favor_num"] as? NSNumber
                        model.modi_class_name = dict["modi_class_name"] as? String
                        model.modi_car_name = dict["modi_car_name"] as? String
                        model.share_num = dict["share_num"] as? NSNumber
                        model.title = dict["title"] as? String
                        model.name = (dict["nr"] as! [String:AnyObject])["name"] as? String
                        model.avatar = (dict["nr"] as! [String:AnyObject])["avatar"] as? String
                        models.addObject(model)
                    }else if type == "2"{ // 文章
                        let model = CarModel()
                        model.type = dic["type"] as? NSNumber
                         let dict = dic["article"] as! [String:AnyObject]
                        model.city_name = dict["city_name"] as? String
                        model.cover = dict["cover"] as? String
                        model.favor_num = dict["favor_num"] as? NSNumber
                        model.modi_class_name = dict["modi_class_name"] as? String
                        model.title = dict["title"] as? String
                        model.share_num = dict["share_num"] as? NSNumber
                        model.name = (dict["nr"] as! [String:AnyObject])["name"] as? String
                        model.avatar = (dict["nr"] as! [String:AnyObject])["avatar"] as? String
                        models.addObject(model)
                        
                    }else if type == "3"{ // 视频
                        let model = CarModel()
                        model.type = dic["type"] as? NSNumber
                        let dict = dic["video"] as! [String:AnyObject]
                        model.city_name = dict["city_name"] as? String
                        model.cover = dict["cover"] as? String
                        model.favor_num = dict["favor_num"] as? NSNumber
                        model.modi_class_name = dict["modi_class_name"] as? String
                        model.share_num = dict["share_num"] as? NSNumber
                        model.title = dict["title"] as? String
                        model.wap = dict["wap"] as? String
                        models.addObject(model) // 添加进来
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(array: models as [AnyObject], error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(array: nil, error: error)
                })
            }
        }
        
        
    }
    
    
    
    
}

















