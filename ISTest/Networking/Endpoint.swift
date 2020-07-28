//
//  Endpoint.swift
//  ISTest
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import Foundation

/* Endpoint
 This class houses all endpoint logic
 */

enum Endpoint: String {
    typealias RawValue = String
    
    //authentication
    case getToken = "authenticate"
    
    //items
    case getItemsList = "item-list"
}
