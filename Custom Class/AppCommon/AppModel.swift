//
//  AppModel.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

var AD_COUNT = 3

class AppModel: NSObject {
    static let shared = AppModel()
    var currentUser : UserModel!
    var LISTCHANNEL : [ListChannelModel] = [ListChannelModel]()
    var SUBSCRIBTION : [ListChannelModel] = [ListChannelModel]()
    var NEWSLIST : [NewsListlModel] = [NewsListlModel]()
    var DeviceID : String = String()
    var DOWNLOADQUEUE : [DownloadQueueModel] = [DownloadQueueModel]()
    var download : DownloadQueueModel!
    
    var FAVORITE : [NewsListlModel] = [NewsListlModel]()
    var MY_NOTES : [MyNotesModel] = [MyNotesModel]()
    
    var clickCount : Int = 0
    
    func removeAllData()
    {
        currentUser = UserModel.init()
        
    }
 
    
//    func getChildrenCommentArrOfDictionary(arr:[ChildrenCommentModel]) -> [[String:Any]]{ // comment
//
//        let len:Int = arr.count
//        var retArr:[[String:Any]] =  [[String:Any]] ()
//        for i in 0..<len{
//            retArr.append(arr[i].dictionary())
//        }
//        return retArr
//    }
    
    
    func validateUser(dict : [String : Any]) -> Bool{
        if let uID = dict["uID"] as? String, let email = dict["email"] as? String
        {
            if(uID != "" && email != ""){
                return true
            }
        }
        return false
    }
    
    func validateInbox(dict : [String : Any]) -> Bool{
        if let id = dict["id"] as? String, let lastMessage = dict["lastMessage"] as? [String:Any]
        {
            if(id != "" && validateLastMessage(dict:lastMessage)){
                return true
            }
        }
        return false
    }
    
    func validateGroup(dict : [String : Any]) -> Bool{
        if let uID = dict["Id"] as? String, uID != ""
        {
            return true
        }
        return false
    }
    
    func validateLastMessage(dict : [String : Any]) -> Bool{
        if let msgID = dict["msgId"] as? String, let key = dict["key"] as? String, let connectUserID = dict["otherUserId"] as? String
        {
            if(msgID != "" && key != "" && connectUserID != ""){
                return true
            }
        }
        return false
    }
 }


class UserModel : AppModel
{
    var id : Int!
    var first_name : String!
    var last_name : String!
    
    
    override init(){
        id = 0
        first_name = ""
        last_name = ""
        
    }
    
    init(dict : [String : Any])
    {
        id = 0
        first_name = ""
        last_name = ""
       
        
        if let temp = dict["id"] as? Int{
            id = temp
        }
        if let temp = dict["first_name"] as? String{
            first_name = temp
        }
        if let temp = dict["last_name"] as? String{
            last_name = temp
        }
        
    }
    
    func dictionary() -> [String:Any]  {
        return ["id":id, "first_name" : first_name, "last_name":last_name]
    }
    
    func toJson(_ dict:[String:Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
}

class ListChannelModel: AppModel {
    
    var channel_id : String!
    var channel_name : String!
    var created_date : String!
    var is_subscribe : String!
    
    override init(){
        channel_id = ""
        channel_name = ""
        created_date = ""
        is_subscribe = ""
        
    }
    
    init(dict : [String : Any])
    {
        channel_id = ""
        channel_name = ""
        created_date = ""
        is_subscribe = ""
        
        
        if let temp = dict["channel_id"] as? String{
            channel_id = temp
        }
        if let temp = dict["channel_name"] as? String{
            channel_name = temp
        }
        if let temp = dict["created_date"] as? String{
            created_date = temp
        }
        if let temp = dict["is_subscribe"] as? String{
            is_subscribe = temp
        }
        
    }
    
    func dictionary() -> [String:Any]  {
        return ["channel_id":channel_id, "channel_name" : channel_name, "created_date":created_date,"is_subscribe":is_subscribe]
    }
    
    func toJson(_ dict:[String:Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
}

class NewsListlModel: AppModel {
    
    var pdf_name : String!
    var pdf_size : String!
    var news_id : String!
    var channel_id : String!
    var news_name : String!
    var news_pdf : String!
    var message : String!
    var news_image : String!
    var news_thumb : String!
    var created_date : String!
    var progress : Double!
    var news_apk : String!
    
    //Advertise
    var id : String!
    var poster : String!
    var poster_name : String!
    
    override init(){
         pdf_name = ""
         pdf_size = ""
         news_id = ""
         channel_id = ""
         news_name = ""
         news_pdf = ""
         message = ""
         news_image = ""
         news_thumb = ""
         created_date = ""
         progress = -1
        news_apk = ""
        
        id = ""
        poster = ""
        poster_name = ""
    }
    
    init(dict : [String : Any])
    {
        pdf_name = ""
        pdf_size = ""
        news_id = ""
        channel_id = ""
        news_name = ""
        news_pdf = ""
        message = ""
        news_image = ""
        news_thumb = ""
        created_date = ""
        progress = -1
        news_apk = ""
        
        id = ""
        poster = ""
        poster_name = ""
        
        if let temp = dict["pdf_name"] as? String{
            pdf_name = temp
        }
        if let temp = dict["pdf_size"] as? String{
            pdf_size = temp
        }
        if let temp = dict["news_id"] as? String{
            news_id = temp
        }
        if let temp = dict["channel_id"] as? String{
            channel_id = temp
        }
        if let temp = dict["news_name"] as? String{
            news_name = temp
        }
        if let temp = dict["news_pdf"] as? String{
            news_pdf = temp
        }
        if let temp = dict["message"] as? String{
            message = temp
        }
        if let temp = dict["news_image"] as? String{
            news_image = temp
        }
        if let temp = dict["news_thumb"] as? String{
            news_thumb = temp
        }
        if let temp = dict["created_date"] as? String{
            created_date = temp
        }
        if let temp = dict["progress"] as? Double{
            progress = temp
        }
        if let temp = dict["news_apk"] as? String{
            news_apk = temp
        }
        if let temp = dict["id"] as? String{
            id = temp
        }
        if let temp = dict["poster"] as? String{
            poster = temp
        }
        if let temp = dict["poster_name"] as? String{
            poster_name = temp
        }
    }
   
    func dictionary() -> [String:Any]  {
        return ["pdf_name":pdf_name, "pdf_size" : pdf_size, "news_id":news_id,"channel_id":channel_id,"news_name":news_name, "news_pdf" : news_pdf, "message":message,"news_image":news_image,"created_date":created_date,"progress":progress, "news_thumb" : news_thumb, "news_apk" : news_apk, "id" : id,"poster":poster,"poster_name":poster_name]
    }
    
    func toJson(_ dict:[String:Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
}



class DownloadQueueModel: AppModel {
    
    var news_id : String!
    var pdf_name : String!
    var news_pdf : String!
    var index : Int!
    
    override init(){
        news_id = ""
        pdf_name = ""
        news_pdf = ""
        index = 0
    }
    
    init(dict : [String : Any])
    {
        news_id = ""
        pdf_name = ""
        news_pdf = ""
        index = 0
        
        if let temp = dict["news_id"] as? String {
            news_id = temp
        }
        if let temp = dict["pdf_name"] as? String {
            pdf_name = temp
        }
        if let temp = dict["news_pdf"] as? String {
            news_pdf = temp
        }
        if let temp = dict["index"] as? Int {
            index = temp
        }
        
    }
    
    func dictionary() -> [String:Any]  {
        return ["news_id":news_id, "pdf_name":pdf_name, "news_pdf":news_pdf, "index":index]
    }
    
    func toJson(_ dict:[String:Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
}

class MyNotesModel : AppModel
{
    var id : String
    var title : String!
    var desc : String!
    var date : String!
    
    override init(){
        id = ""
        title = ""
        desc = ""
        date = ""
    }
    
    init(dict : [String : Any])
    {
        id = ""
        title = ""
        desc = ""
        date = ""
        
        if let temp = dict["id"] as? String{
            id = temp
        }
        if let temp = dict["title"] as? String{
            title = temp
        }
        if let temp = dict["desc"] as? String{
            desc = temp
        }
        if let temp = dict["date"] as? String{
            date = temp
        }
    }
    
    func dictionary() -> [String:Any]  {
        return ["id":id, "title" : title, "desc":desc, "date":date]
    }
    
    func toJson(_ dict:[String:Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
}
