
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import Foundation
import SystemConfiguration
import Alamofire
import AlamofireImage


//Development
struct API {
    static let BASE_URL = "http://codetrinity.com/newspaper/api/api/Services/"
    
    static let LIST_CHANNEL        =       BASE_URL + "list_channel"
    static let SUBSCRIBE_CHANNEL   =       BASE_URL + "subscription"
    static let LIST_SUBSCRIBE      =       BASE_URL + "list_subscriptions"
    static let LIST_NEWS           =       BASE_URL + "list_news"
    static let CHECK_VERSION       =       BASE_URL + "version"
    
    static let ADD_ADVERTISE       =       BASE_URL + "add_advertise"
    static let GET_ADVERTISE       =       BASE_URL + "list_advertise"
}


public class APIManager {
    
    static let shared = APIManager()
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    func getJsonHeader() -> [String:String]{
        return ["Content-Type":"application/json", "Accept":"application/json"]
    }
    
    func getJsonHeaderParamWithAuth() -> [String : String] {
        return ["Authorization": "Basic YmFzaWM6MTIzNA=="]
    }
    
//    func getMultipartHeader() -> [String:String]{
//        return ["Content-Type":"multipart/form-data", "Accept":"application/json", "Authorization": "Bearer " + AppModel.shared.currentUser.accessToken]
//    }
//
//    func getJsonHeaderWithToken() -> [String:String] {
//        return ["Content-Type":"application/json", "X-Requested-With":"XMLHttpRequest","Accept":"application/json", "Authorization": "Bearer " + AppModel.shared.currentUser.accessToken]
//    }
//
//    func getJsonHeaderParamWithToken() -> [String:String] {
//        return ["Content-Type":"application/json","Accept":"application/json", "Authorization": "Bearer " + AppModel.shared.currentUser.accessToken]
//    }
//
//    func getMultipartHeaderWithToken() -> [String:String]{
//        return ["Accept":"multipart/form-data", "Content-Type" : "multipart/form-data" ,"Authorization":"Bearer " + AppModel.shared.currentUser.accessToken]
//    }
    
    func networkErrorMsg()
    {
        removeLoader()
        showAlert("Greeky", message: "You are not connected to the internet") {
            
        }
    }
    
//    func isServiceError(_ code: Int?) -> Bool{
//        if(code == 401)
//        {
//            AppDelegate().sharedDelegate().logout()
//            return true
//        }
//        return false
//    }
    
    func getBase64Credentials() -> [String : String] {
        let email : String = "basic"
        let pass : String = "1234"
        let credentialData = "\(email):\(pass)".data(using: String.Encoding.utf8)!
        var headerParams :[String : String] = [String : String] ()
        headerParams["Authorization"] = "Basic \(credentialData.base64EncodedString(options: []))"
        return headerParams
    }
    

    
//    func serviceCallToListChannel(_ completion: @escaping () -> Void){
//
//        let headerParams :[String : String] = getBase64Credentials()
//
//        var param : [String : Any] = [String : Any]()
//        param["device_id"] = AppModel.shared.DeviceID
//
//        Alamofire.request(API.LIST_CHANNEL, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headerParams).responseJSON { (response) in
//
//            switch response.result {
//            case .success:
//                print(response.result.value!)
//                if let result : [String : Any] = response.result.value as? [String : Any]
//                {
//                    if let data : [[String : Any]] = result["data"] as? [[String : Any]]
//                    {
//                        setNewsChannelList(data)
//                        completion()
//                        return
//                    }
//                    else if let message : String = result["message"] as? String
//                    {
//                        showAlert("Login Error", message: message, completion: {
//
//                        })
//                    }
//                }
//                if let error = response.result.error
//                {
//                    showAlert("Login Error", message: "\(error.localizedDescription)", completion: {
//
//                    })
//                    return
//                }
//                break
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
//    }
//
//
//    func serviceCallToAddSubscription(_ params : [String : Any],_ completion: @escaping (_ status : String) -> Void) {
//
//        var headerParams : [String : String] = getBase64Credentials()
//        headerParams["Content-Type"] = "multipart/form-data"
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            for (key, value) in params {
//                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//            }
//        }, usingThreshold: UInt64.init(), to: API.SUBSCRIBE_CHANNEL, method: .post
//        , headers: headerParams) { (result) in
//            switch result{
//            case .success(let upload, _, _):
//                upload.uploadProgress(closure: { (Progress) in
////                    print("Upload Progress: \(Progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { (response) in
//
//                    switch response.result {
//                    case .success:
//                        print(response.result.value!)
//                        if let result : [String : Any] = response.result.value as? [String : Any]
//                        {
//                            if let status : Int = result["status"] as? Int
//                            {
//                                if status == 1 {
//                                    if let message : String = result["message"] as? String {
//                                        completion(message)
//                                        return
//                                    }
//                                }
//
//                            }
//                            else if let message1 : String = result["message"] as? String
//                            {
//                                displayToast(message1)
//                                return
//                            }
//                        }
//
//                        if let error = response.result.error
//                        {
//                            displayToast(error.localizedDescription)
//                            return
//                        }
//
//                        break
//                    case .failure(let error):
//                        print(error)
//                        displayToast(error.localizedDescription)
//                        break
//                    }
//                }
//            case .failure(let error):
//                removeLoader()
//                displayToast(error.localizedDescription)
//                break
//            }
//        }
//    }
    
  
   
}
