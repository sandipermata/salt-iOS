//
//  UserData.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import Foundation

struct UserData: Codable {
    let page : Int?
    let per_page : Int?
    let total : Int?
    let total_page : Int?
    let data : [data]?
    let support : support?
    
    internal init(page: Int?, per_page: Int?, total: Int?, total_page: Int?, data: [data]?, support: support?) {
        self.page = page
        self.per_page = per_page
        self.total = total
        self.total_page = total_page
        self.data = data
        self.support = support
    }
    private enum CodingKeys: String, CodingKey {
        case page, per_page, total, total_page, data, support
    }
}

struct data : Codable {
    
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

struct support : Codable {
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
