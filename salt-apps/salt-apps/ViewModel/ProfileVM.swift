//
//  ProfileVM.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import Foundation
import Sample3

class ProfileVM {
    
    static var sharedInstance = ProfileVM()
    var proUser = [ProData]()
   
    var email = String()
    var name = String()
    var avatar = String()
    
    
    func fetchData(page : Int, isRefresh : Bool = false, completion : @escaping (_ success: Bool, _ response : Any?, _ isRefresh : Bool) -> Void) {
        apiResult(url: "https://reqres.in/api/users/4",param: nil, method: .get, callback: { [self] (success, response, statusCode) in
            if success{
                guard let data = response else { return }
                do{
                    let decodeData = try JSONDecoder().decode(SettingData.self, from: data as! Data)
                    self.email.append((decodeData.data?.email)!)
                    self.name.append((decodeData.data?.first_name)!)
                    self.avatar.append((decodeData.data?.avatar)!)
                    completion(true, "success", isRefresh)
                }
                catch let jsonErr{
                    completion(false, "failed", isRefresh)
                    print("data error \n\(jsonErr)")
                }
            }
            else{
                print("Cek Post False")
            }
        })
        
    }
    
    func numberOfRowsInSection() -> Int {
        return proUser.count
    }
}
