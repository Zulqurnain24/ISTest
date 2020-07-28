//
//  ItemsResponse.swift
//  ISTest
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

struct ItemsResponse: Codable, Equatable {
    
    var itemList: [Item]?
    let timestamp: Int?
    let status: Int?
    let error: String?
    let message: String?
    let path: String?
    
    init(itemList: [Item]?, timestamp: Int?, status: Int?, error: String?, message: String?, path: String?){
        self.itemList = itemList
        self.timestamp = timestamp
        self.status = status
        self.error = error
        self.message = message
        self.path = path
    }

    mutating func setList(itemList: [Item]?) {
        self.itemList = itemList
    }
    
    static func == (lhs: ItemsResponse, rhs: ItemsResponse) -> Bool {
        return lhs.itemList == rhs.itemList
               &&
               lhs.timestamp == rhs.timestamp
               &&
               lhs.status == rhs.status
               &&
               lhs.error == rhs.error
               &&
               lhs.message == rhs.message
               &&
               lhs.path == rhs.path
    }
}
