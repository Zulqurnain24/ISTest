//
//  TestItemsViewModel.swift
//  ISTestTests
//
//  Created by macbook on 29/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import XCTest
@testable import ISTest

class TestItemsViewModel: XCTestCase {
    
    var sut: ItemsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ItemsViewModel()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewModel() {

        sut.setItemsResponse(itemList: [Item(id: 0, name: "Cap", description: "New Original Wool Chitrali Cap For Boys", price: 1150.0, itemRate: 4), Item(id: 1, name: "Chitraly Shawl", description: "Linen material", price: 2000.0, itemRate: 4)], timestamp: 100, status: 0, error: nil, message: "Success", path: "../")
        let itemList = sut.getItemList()
        let item = itemList.first
        
        XCTAssertEqual(item?.name, "Cap")
        XCTAssertEqual(item?.description, "New Original Wool Chitrali Cap For Boys")
        XCTAssertEqual(item?.price,  1150.0)
    }
}

extension TestItemsViewModel: ItemsViewModelDelegate {
    func getItemList(_ itemList: [Item]?, _ error: String?) {
         XCTAssertTrue(!itemList!.isEmpty)
    }
}
