//
//  Preference.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class Preference: NSObject {

    static let sharedInstance = Preference()
    
    let IS_USER_LOGIN_KEY       =   "IS_USER_LOGIN"
    let USER_DATA_KEY           =   "USER_DATA"
    let USER_LATITUDE_KEY       =   "USER_LATITUDE"
    let USER_LONGITUDE_KEY      =   "USER_LONGITUDE"
    let USER_CARD               =   "USER_CARD_DETAIL"
    let IS_FACEBOOK_USER_LOGIN_KEY = "IS_FACEBOOK_USER"
    let FAVORITE_NEWS_KEY       =   "FAVORITE_NEWS_KEY"
    let CITY_DATA_KEY           =   "CITY_DATA_KEY"
}


func setDataToPreference(data: AnyObject, forKey key: String)
{
    UserDefaults.standard.set(data, forKey: key)
    UserDefaults.standard.synchronize()
}

func getDataFromPreference(key: String) -> AnyObject?
{
    return UserDefaults.standard.object(forKey: key) as AnyObject?
}

func removeDataFromPreference(key: String)
{
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}

func removeUserDefaultValues()
{
    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    UserDefaults.standard.synchronize()
}

//MARK: - User login boolean
func setIsUserLogin(isUserLogin: Bool)
{
    setDataToPreference(data: isUserLogin as AnyObject, forKey: Preference.sharedInstance.IS_USER_LOGIN_KEY)
}

func isUserLogin() -> Bool
{
    let isUserLogin = getDataFromPreference(key: Preference.sharedInstance.IS_USER_LOGIN_KEY)
    return isUserLogin == nil ? false:(isUserLogin as! Bool)
}

func setNewsChannelUpdateDate()
{
    setDataToPreference(data: getCurrentTimeStampValue() as AnyObject, forKey: "news_channels_date")
}

func getNewsChannelUpdateDate() -> String?
{
    if let timestamp = getDataFromPreference(key: "news_channels_date")
    {
        return timestamp as? String
    }
    return nil
}

func setNewsChannelList(_ dictData: [[String : Any]])
{
    setDataToPreference(data: dictData as AnyObject, forKey: "news_channels")
}

func getNewsChannelList() -> [ListChannelModel]
{
    if let data : [[String : Any]] = getDataFromPreference(key: "news_channels") as? [[String : Any]]
    {
        AppModel.shared.LISTCHANNEL = [ListChannelModel]()
        for temp in data
        {
            if let channel : ListChannelModel = ListChannelModel.init(dict: temp)
            {
                if channel.channel_id != "28"
                {
                    AppModel.shared.LISTCHANNEL.append(channel)
                }
                else
                {
                    setBookChanelData(channel)
                }
                
            }
        }
        return AppModel.shared.LISTCHANNEL
    }
    return [ListChannelModel]()
}

func setSelectedNewsChannelList(_ data: [ListChannelModel])
{
    var dictData : [[String : Any]] = [[String : Any]]()
    for temp in data
    {
        dictData.append(temp.dictionary())
    }
    setDataToPreference(data: dictData as AnyObject, forKey: Preference.sharedInstance.CITY_DATA_KEY)
}

func getSelectedNewsChannelList() -> [ListChannelModel]
{
    if let data : [[String : Any]] = getDataFromPreference(key: Preference.sharedInstance.CITY_DATA_KEY) as? [[String : Any]]
    {
        var channelData : [ListChannelModel] = [ListChannelModel]()
        for temp in data
        {
            channelData.append(ListChannelModel.init(dict: temp))
        }
        return channelData
    }
    return [ListChannelModel]()
}

func setBookChanelData(_ data: ListChannelModel)
{
    setDataToPreference(data: (data.dictionary() as AnyObject), forKey: "books_and_magagines")
}

func getBookChanelData() -> ListChannelModel
{
    if let data : [String : Any] = getDataFromPreference(key: "books_and_magagines") as? [String : Any]
    {
        return ListChannelModel.init(dict: data)
    }
    return ListChannelModel.init()
}

func setFavoriteNewsList(_ data: [NewsListlModel])
{
    var dictData : [[String : Any]] = [[String : Any]]()
    for temp in data
    {
        dictData.append(temp.dictionary())
    }
    setDataToPreference(data: dictData as AnyObject, forKey: Preference.sharedInstance.FAVORITE_NEWS_KEY)
}

func getFavoriteNewsList() -> [NewsListlModel]
{
    if let data : [[String : Any]] = getDataFromPreference(key: Preference.sharedInstance.FAVORITE_NEWS_KEY) as? [[String : Any]]
    {
        var channelData : [NewsListlModel] = [NewsListlModel]()
        for temp in data
        {
            channelData.append(NewsListlModel.init(dict: temp))
        }
        return channelData
    }
    return [NewsListlModel]()
}


func setNoteList(_ newNote: MyNotesModel)
{
    var noteData : [MyNotesModel] = getNoteList()
    let index = noteData.index { (temp) -> Bool in
        temp.id == newNote.id
    }
    if index != nil {
        noteData[index!] = newNote
    }else{
        noteData.append(newNote)
    }
    var dictData : [[String : Any]] = [[String : Any]]()
    for temp in noteData
    {
        dictData.append(temp.dictionary())
    }
    setDataToPreference(data: dictData as AnyObject, forKey: "my_notes_list")
}

func getNoteList() -> [MyNotesModel]
{
    if let data : [[String : Any]] = getDataFromPreference(key: "my_notes_list") as? [[String : Any]]
    {
        AppModel.shared.MY_NOTES = [MyNotesModel]()
        for temp in data
        {
            AppModel.shared.MY_NOTES.append(MyNotesModel.init(dict: temp))
        }
        return AppModel.shared.MY_NOTES
    }
    return [MyNotesModel]()
}

func setRecentChanelData(_ data: ListChannelModel)
{
    setDataToPreference(data: (data.dictionary() as AnyObject), forKey: "recent_channel")
}

func getRecentChanelData() -> ListChannelModel
{
    if let data : [String : Any] = getDataFromPreference(key: "recent_channel") as? [String : Any]
    {
        return ListChannelModel.init(dict: data)
    }
    return ListChannelModel.init()
}

