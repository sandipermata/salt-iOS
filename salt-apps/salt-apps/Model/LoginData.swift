//
//  LoginData.swift
//  salt-apps
//
//  Created by SANDI on 06/07/22.
//

import Foundation

struct LoginData: Codable {
    let token : String?
    let error : String?
   
    internal init(token: String?, error: String?) {
        self.token = token
        self.error = error
    }
    
    private enum CodingKeys: String, CodingKey {
        case token, error
    }
}
