//
//  GlobalConstant.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import Foundation
import UIKit


let APP_VERSION = 1.0
let BUILD_VERSION = 1
let DEVICE_ID = UIDevice.current.identifierForVendor?.uuidString


let ITUNES_URL = ""

var PartnerImg = ["partner1","partner2","partner3","partner4"]

//var newsImgArr = ["newsImg1","newsImg2","newsImg3"]

//var reportImgArr = ["reportImg1","reportImg2","reportImg3","reportImg4"]
var reportLbl = ["Annual Growth","Financial Report","Investor Relations","Earning Report"]
var reportcolor = ["156CD1","5D3BC3","1c252a","C642BA"]

var collectionOfItem = ["Plastic","Plastic"]



struct STRIPE {
    static var PUBLISH_KEY = "pk_test_91eUV44WQZfEq7nrOyRQlNMz"
    static var SECRET_KEY = "sk_test_URLT7y8Bbe5zkgXsus7cL5z1"
}

struct SCREEN
{
    static var WIDTH = UIScreen.main.bounds.size.width
    static var HEIGHT = UIScreen.main.bounds.size.height
}

struct DATE_FORMAT {
    static var SERVER_DATE_FORMAT = "dd/MM/yyyy"
    static var SERVER_TIME_FORMAT = "HH:mm"
    static var SERVER_DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss"
    static var DISPLAY_DATE_FORMAT = "dd/MM/yyyy"
    static var DISPLAY_DATE_FORMAT1 = "dd/MM/yyyy"
    static var DISPLAY_TIME_FORMAT = "hh:mm a"
    static var DISPLAY_DATE_FORMAT2 = "dd MMMyyyy"
    static var DISPLAY_DATE_TIME_FORMAT = "dd/MM/yyyy HH:mm"
}

struct CONSTANT{
    static var DP_IMAGE_WIDTH     =  1000
    static var DP_IMAGE_HEIGHT    =  1000
    
    static let MAX_EMAIL_CHAR = 254
    static let MAX_PREFER_NAME_CHAR = 40
    static let MIN_PWD_CHAR = 8
    static let MAX_PWD_CHAR = 16
    static let MAX_FIRST_NAME_CHAR = 40
    static let MAX_MIDDLE_NAME_CHAR = 40
    static let MAX_LAST_NAME_CHAR = 40
    
    static let DOB_CHAR = 8
    static let DOB_SPACE_CHAR = 4
    static let DOB_DATE_CHAR = 2
    static let DOB_YEAR_CHAR = 4
    
    static let MOBILE_NUMBER_CHAR = 8
    static let MOBILE_NUMBER_SPACE_CHAR = 2
    static let MOBILE_NUMBER_CODE = ""
    
    static let CARD_NUMBER_CHAR = 16
    static let CARD_NUMBER_DASH_CHAR = 3
    static let CARD_EXP_DATE_CHAR = 5
    static let CARD_CVV_CHAR = 3
    
    static let SMS_CODE_CHAR = 4
    static let SMS_CODE_SPACE_CHAR = 3
    
    static let IMAGE_QUALITY   =  1
    
    static let CURRENCY   =  "$"
    static let DIST_MEASURE   =  "km"
    static let TIME_ZONE = "Australia/Sydney"
    
    static let DEF_TAKE : Int = 24
    
    
}

struct MEDIA {
    static var IMAGE = "IMAGE"
    static var VIDEO = "VIDEO"
}

struct IMAGE {
    static var USER_PLACEHOLDER = "avatar_placeholder"
    static var VIDEO_PLACEHOLDER = "video_placeholder"
}

struct STORYBOARD {
    static var MAIN = UIStoryboard(name: "Main", bundle: nil)
    
}

struct NOTIFICATION {
    static var UPDATE_CURRENT_USER_DATA     =   "UPDATE_CURRENT_USER_DATA"
    static var UPDATE_SELECTION_DATA        =   "UPDATE_SELECTION_DATA"
    static var UPDATE_POST_LIST             =   "UPDATE_POST_LIST"
    static var UPDATE_FLYER_LIST            =   "UPDATE_FLYER_LIST"
    
    static var ON_UPDATE_ALL_USER           =   "ON_UPDATE_ALL_USER"
    static var UPDATE_DOWLOAD_STATUS        =   "UPDATE_DOWLOAD_STATUS"
    static var UPDATE_INBOX_LIST            =   "UPDATE_INBOX_LIST"
    static var REDICT_TAB_BAR               =   "REDICT_TAB_BAR"
    static var UPDATE_CARD_DATA             =   "UPDATE_CARD_CATA"
    static var UPDATE_NEWSDATA              =   "UPDATE_NEWSDATA"
    
    static var REDIRECT_TO_ADDADVERT        =    "REDIRECT_TO_ADDADVERT"
    static var REDIRECT_TO_BOOKSMAGAZINE    =    "REDIRECT_TO_BOOKSMAGAZINE"
    static var REDIRECT_TO_RECENTNEWS       =    "REDIRECT_TO_RECENTNEWS"
    static var REDIRECT_TO_FAVOURITE        =    "REDIRECT_TO_FAVOURITE"
    
}

struct COREDATA {
    struct MESSAGE
    {
        static var TABLE_NAME = "Message"
        static var key = "key"
        static var msgID = "msgID"
        static var otherUserId = "otherUserId"
        static var date = "date"
        static var text = "text"
        static var status = "status"
    }
    struct USER
    {
        static var TABLE_NAME = "User"
        static var id = "uID"
        static var name = "name"
        static var email = "email"
        static var picture = "picture"
        static var last_seen = "last_seen"
    }
}

struct GENDER {
    static var GREEK_GOD = "GREEK_GOD"
    static var GREEK_GODDESS = "GREEK_GODDESS"
}


struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}

//struct AppUtility {
//    
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
//        
//        if let delegate = UIApplication.shared.delegate as? AppDelegate {
//            delegate.orientationLock = orientation
//        }
//    }
//    
//    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
//        
//        self.lockOrientation(orientation)
//        
//        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
//    }
//    
//}

struct GOOGLE_AD {
    //Test
    static var ID = "ca-app-pub-6883152161675549~7606835319"
    static var BANNER = "ca-app-pub-3940256099942544/6300978111"
    static var INTERTITIAL = "ca-app-pub-3940256099942544/1033173712"
    
    //Live
//    static var ID = "ca-app-pub-1029060433685593~1071579372"
//    static var BANNER = "ca-app-pub-1029060433685593/2081995442"
//    static var INTERTITIAL = "ca-app-pub-1029060433685593/8965423401"
}
