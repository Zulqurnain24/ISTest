//
//  TestLoginViewModel.swift
//  ISTestTests
//
//  Created by macbook on 29/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import XCTest
@testable import ISTest

class TestLoginViewModel: XCTestCase {
    
    var sut: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        sut = LoginViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewModel() {
         sut.getToken("test1", "123")
    }
}

extension TestLoginViewModel: LoginViewModelDelegate {
    func getToken(_ token: String?, _ error: String?) {
        XCTAssertTrue(!token!.isEmpty)
    }
}
