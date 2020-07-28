//
//  Token.swift
//  ISTest
//
//  Created by macbook on 28/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

struct Token: Codable, Equatable {
    
    let token: String?
    let timestamp: Date?
    
    init(token: String?, timestamp: Date?){
        self.token = token
        self.timestamp = timestamp
    }

    static func == (lhs: Token, rhs: Token) -> Bool {
        return  lhs.token == rhs.token
                &&
                lhs.timestamp == rhs.timestamp
    }
}
