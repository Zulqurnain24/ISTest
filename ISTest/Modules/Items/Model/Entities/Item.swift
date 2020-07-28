//
//  Item.swift
//  ISTest
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

struct Item: Codable, Equatable {
    
     let id: Int?
     let name: String?
     let description: String?
     let price: Double?
     let itemRate: Int?
    
    private enum UserKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case itemRate
    }
    
    init(id: Int,
         name: String,
         description: String,
         price: Double,
         itemRate: Int){
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.itemRate = itemRate
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
                &&
                lhs.name == rhs.name
                &&
                lhs.description == rhs.description
                &&
                lhs.price == rhs.price
                &&
                lhs.itemRate == rhs.itemRate
    }
}
