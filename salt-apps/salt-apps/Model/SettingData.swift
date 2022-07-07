//
//  SettingData.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import Foundation

struct SettingData: Codable {
    let data: ProData?
    let support : proSupport?
    
    internal init(data: ProData?, support: proSupport?) {
        self.data = data
        self.support = support
    }
    private enum CodingKeys: String, CodingKey {
        case data, support
    }
}

struct ProData : Codable {
    let id: Int?
    let email : String?
    let first_name : String?
    let last_name : String?
    let avatar : String?
    
    internal init(id: Int?, email: String?, first_name: String?, last_name: String?, avatar: String?) {
        self.id = id
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.avatar = avatar
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, email, first_name, last_name, avatar
    }
}


struct proSupport : Codable {
    let url : String?
    let text : String?
    
    internal init(url: String?, text: String?) {
        self.url = url
        self.text = text
    }
    private enum CodingKeys: String, CodingKey {
        case url, text
        
    }
}
