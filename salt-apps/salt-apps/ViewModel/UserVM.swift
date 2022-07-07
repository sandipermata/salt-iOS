//
//  UserVM.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import Foundation
import Sample3

class UserVM {
    
    static var sharedInstance = UserVM()
    var dataUser = [data]()
    
    func fetchData(page : Int, isRefresh : Bool = false, completion : @escaping (_ success: Bool, _ response : Any?, _ isRefresh : Bool) -> Void) {
        apiResult(url: "https://reqres.in/api/users",param: nil, method: .get, callback: { (success, response, statusCode) in
            if success{
                guard let data = response else { return }
                
                do{
                    self.dataUser.removeAll()
                    let decodeData = try JSONDecoder().decode(UserData.self, from: data as! Data)
                    self.dataUser.append(contentsOf: decodeData.data!)
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
        return dataUser.count
    }
}
