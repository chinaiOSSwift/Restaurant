//
//  CourseModels.swift
//  PoKitchen
//
//  Created by 夏婷 on 16/9/18.
//  Copyright © 2016年 夏婷. All rights reserved.
//

import Foundation

class CommentModel: JSONModel {
    var content:String!
    var createTime:String! = ""
    var headImg:String!
    var id:String!
    var istalent:NSNumber!
    var nick:String!
    var parentId:String!
    var parents:NSMutableArray?
    var relateId:String!
    var type:String!
    var userId:String!
    required init(dictionary dict: [NSObject : AnyObject]!) throws {
        super.init()
        //使用KVC 替换JSONModel中的赋值
        self.setValuesForKeysWithDictionary(dict as! [String:AnyObject])
        let array = dict["parents"] as? [AnyObject]
        //特殊处理回复评论信息
        do{
           self.parents = try CommentModel.arrayOfModelsFromDictionaries(array, error: ())
        }catch{
           self.parents = NSMutableArray()
        }
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if key == "create_time"{
            self.setValue(value, forKey: "createTime")
        }else if key == "head_img"{
            self.setValue(value, forKey: "headImg")
        }else if key == "parent_id"{
            self.setValue(value, forKey: "parentId")
        }else if key == "relate_id"{
            self.setValue(value, forKey: "relateId")
        }else if key == "user_id"{
            self.setValue(value, forKey: "userId")
        }else{
            //普通的字段赋值
            super.setValue(value, forKey: key)
        }
    }
    
    required init(data: NSData!) throws {
        fatalError("init(data:) has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// 课程系列模型

class SeriesModel: JSONModel {
    var episode:String!
    var lastUpdate:String!
    var orderNo:String!
    var play:String!
    var relateActivity:String!
    var seriesId:String!
    var seriesImage:String!
    var seriesName:String!
    var seriesTitle:String!
    var shareDescription:String!//做第三方分享时的一个内容说明
    var shareImage:String!
    var shareTitle:String!
    var shareUrl:String!
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(propertyName:String)->Bool{
        
        return true
    }
}
/**选集模型*/
class CourseModel: JSONModel {
    
    var courseId:String!
    var courseImage:String!
    var courseIntroduce:String!
    var courseName:String!
    var courseSubject:String!
    var courseVideo:String!
    var episode:String!
    var isCollect:String!
    var isLike:String!
    var ischarge:String!
    var price:String!
    var videoWatchcount:String!
    
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
}

/**点赞好友模型*/
class FriendModel: JSONModel {
    
    var createTime:String!
    var createTimeCn:String!
    var headImg:String!
    var nick:String!
    var userId:String!
    var istalent:String!
    //去下划线 
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
}

