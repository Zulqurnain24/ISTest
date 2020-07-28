//
//  Item.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

struct AuthResponse: Codable, Equatable {
    
    let token: String?
    let timestamp: Int?
    let status: Int?
    let error: String?
    let message: String?
    let path: String?
    
    init(token: String?, timestamp: Int?, status: Int?, error: String?, message: String?, path: String?){
        self.token = token
        self.timestamp = timestamp
        self.status = status
        self.error = error
        self.message = message
        self.path = path
    }

    static func == (lhs: AuthResponse, rhs: AuthResponse) -> Bool {
        return lhs.token == rhs.token
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
