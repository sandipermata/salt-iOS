//
//  networkServiceViewController.swift
//  SJIalmofire
//
//  Created by adriansalim on 21/04/20.
//  Copyright © 2020 adriansalim. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration

public typealias HTTPHeaders = [String: String]
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
/*
 200 = Success get response from server
 400 = Bad request
 500 = Internal server error
 501 = No data from server
 503 = No connection
 */


public func apiResult(url: String, param: [String : Any]?, method: Alamofire.HTTPMethod, callback: @escaping (_ result: Bool, _ response: Any?, _ statusCode: String?) -> Void) {
    if(Reachability.getNetworkType() == "No Connection"){
        callback(false, "Please check your connection", "503")
    }
    else{
        let currentHeaders = [
            "Content-Type" : "application/x-www-form-urlencoded",
            ] as HTTPHeaders
        
        Alamofire.request(URL(string: url)!, method: method, parameters: param, encoding: URLEncoding.default, headers: currentHeaders)
            .responseJSON{ response in
                if(response.response == nil){
                    callback(false, nil, "501")
                }
                else{
                    let statusCode = response.response?.statusCode
                    switch statusCode!{
                    case 200:
                        callback(true, response.data, "200")
                    case 400:
                        print("Bad Request")
                        callback(false, nil, "400")
                        break
                    case 503:
                        print("No internet Connection")
                        callback(false, nil, "503")
                        break
                    default:
                        callback(false, nil, "500")
                        break
                    }
                }
        }
    }
    
}

/* example upload param with image

 let param = [
 "uuid": UIDevice.current.identifierForVendor!.uuidString,
 "judul": "png image",
 "isi": "testing png image",
 "status": 1,
 "foto_id": NSDate().timeIntervalSince1970
 ] as [String : Any]
 
 self.apiImageParam(param: param, imageName: "example.png", imageChoosen: UIImage(named: "test-png.png")!, imageType: "image/png", imageCompress: 0.5, paramImageUpload: "foto", url: "http://foxdiary.solusijaringan.id/diary/add")
 
 
*/




public func apiImageParam(url: String, param: [String : Any], imageName:String, imageChoosen:UIImage, imageType:String, imageCompress:CGFloat, paramImageUpload:String, callback: @escaping (_ result: Bool, _ response: Any?, _ statusCode: String?) -> Void) {
    if(Reachability.getNetworkType() == "No Connection"){
        callback(false, "Please check your connection", "503")
    }
    else{
        let imageData = imageChoosen.jpegData(compressionQuality: imageCompress)
        Alamofire.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(imageData!, withName: paramImageUpload, fileName: imageName, mimeType: imageType)
                for (key, value) in param {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: url)
            { (result) in
                switch result {
                case .success(let upload, _, _):
                    upload.uploadProgress(closure: { (progress) in
                        print("uploading \(progress)")

                    })

                    upload.responseJSON { response in
                        print("success") 
                        print(response.result)
                        callback(true, "success", "200")

                    }
                case .failure( _):
                    callback(false, "failed", "501")
                    break
                }
            }
    }
    
}

public func getIpAddress(callback: @escaping (_ ip: String?) -> Void) {
    Alamofire.request("https://api.ipify.org").responseString { (response) in
        if(response.value! != ""){
            callback(response.value!)
        }
        else{
            callback("")
        }
    }
}
