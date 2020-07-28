//
//  Enums.swift
//  ISTest
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import Foundation

// swift result type
enum RequestType: String, Codable {
    typealias RawValue = String
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

// swift result type
enum ResultType<T> {
    case Success(T)
    case Failure(e: Error)
}

// Error for unknown case
enum JSONDecodingError: Error, LocalizedError {
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("Unknown Error occured", comment: "")
        }
    }
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    case segueToDetailScreen = "segueToDetailScreen"
    case itemCell = "ItemCell"
    case unableToAuthenticate = "Unable to authenticate please make sure the credentials you entered are correct"
    case segueToItemsScreen = "segueToItemsScreen"
    case main = "Main"
    case price = "Price"
    case splashViewController = "SplashViewController"
    case defaultConfiguration = "Default Configuration"
    case loading = "Loading"
    case username = "username"
    case password = "password"
    case token = "token"
    case noConnection = "No Connection"
    case internetErrorTitleText = "Error"
    case fillFields = "Please complete the fields"
    case internetErrorMessageText = "Please connect to internet."
    case serviceUnavailable = "It seems service is unavailable temporarily. Please try again later"
    case issueWithTheServer = "It seems there is an issue with the server at the moment. Please try later"
    case persistentStoreData = "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data"
}

