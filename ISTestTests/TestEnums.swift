//
//  TestEnums.swift
//  ISTestTests
//
//  Created by macbook on 29/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import XCTest
@testable import ISTest

class TestEnums: XCTestCase {
    
    func testEnums() {
        checkStringValue(StringConstants.segueToDetailScreen.rawValue, "segueToDetailScreen")
         checkStringValue(StringConstants.itemCell.rawValue, "ItemCell")
         checkStringValue(StringConstants.unableToAuthenticate.rawValue, "Unable to authenticate please make sure the credentials you entered are correct")
         checkStringValue(StringConstants.segueToItemsScreen.rawValue, "segueToItemsScreen")
         checkStringValue(StringConstants.main.rawValue, "Main")
         checkStringValue(StringConstants.price.rawValue, "Price")
         checkStringValue(StringConstants.splashViewController.rawValue, "SplashViewController")
         checkStringValue(StringConstants.defaultConfiguration.rawValue, "Default Configuration")
         checkStringValue(StringConstants.loading.rawValue, "Loading")
         checkStringValue(StringConstants.username.rawValue, "username")
         checkStringValue(StringConstants.password.rawValue, "password")
         checkStringValue(StringConstants.token.rawValue, "token")
         checkStringValue(StringConstants.noConnection.rawValue, "No Connection")
         checkStringValue(StringConstants.internetErrorTitleText.rawValue, "Error")
         checkStringValue(StringConstants.fillFields.rawValue, "Please complete the fields")
        checkStringValue(StringConstants.internetErrorMessageText.rawValue, "Please connect to internet.")
         checkStringValue(StringConstants.serviceUnavailable.rawValue, "It seems service is unavailable temporarily. Please try again later")
         checkStringValue(StringConstants.issueWithTheServer.rawValue, "It seems there is an issue with the server at the moment. Please try later")
        checkStringValue(StringConstants.persistentStoreData.rawValue, "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data")
    }
    
    // MARK: - private tests

     private func checkStringValue(_ value: String,  _ actualVal: String) {
         XCTAssertEqual(value, actualVal)
     }
}
