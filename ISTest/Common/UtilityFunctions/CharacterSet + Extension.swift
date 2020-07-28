//
//  CharacterSet + Extension.swift
//  
//
//  Created by Mohammad Zulqurnain 06/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//
import  Foundation

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
