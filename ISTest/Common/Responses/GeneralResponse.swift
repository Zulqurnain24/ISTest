//
//  GeneralResponse.swift
//  
//
//  Created by Mohammad Zulqurnain 18/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

/* GeneralResponse
This entity contains the general response data
*/
struct GeneralResponse: Codable, Equatable {

    let status: Bool
    let code: Int?
    let message: String?
    
    private enum UserKeys: String, CodingKey {
        case  status
        case  code
        case  message
    }
    
    init(status: Bool, code: Int, message: String) {
        self.status = status
        self.code = code
        self.message = message
    }
    
    static func == (lhs: GeneralResponse, rhs: GeneralResponse) -> Bool {
        return      lhs.status == rhs.status &&
                    lhs.code ==  rhs.code &&
                    lhs.message == rhs.message
    }
    
}
