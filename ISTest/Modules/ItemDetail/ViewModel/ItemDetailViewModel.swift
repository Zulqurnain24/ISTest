//
//  ItemDetailViewModel.swift
//  ISTest
//
//  Created by macbook on 28/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import Foundation

class ItemDetailViewModel {
    private var item: Item?

    func setItem(item: Item) {
        self.item = item
    }

    func getItem() -> Item? {
        return self.item
    }

}

