//
//  ItemsViewModel.swift
//  ISTest
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import Foundation

protocol ItemsViewModelDelegate: class {
    func getItemList(_ itemList: [Item]?, _ error: String?)
}

class ItemsViewModel {
    private let webserviceManager = WebserviceManager()
    private var dataItem: ItemsResponse?
    weak var delegate: ItemsViewModelDelegate?

    func configure(row: Int, cell: ItemCell) {
        guard let item = dataItem?.itemList?[row]
        else { return }
        
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = "\(item.price ?? 0.0)"
        cell.nameLabel.text = item.name
    }

    func setItemsResponse(itemList: [Item]?, timestamp: Int?, status: Int?, error: String?, message: String?, path: String?) {
         dataItem = ItemsResponse(itemList: itemList, timestamp: timestamp, status: status, error: error, message: message, path: path)
    }
    
    func getItemList() -> [Item] {
        return dataItem?.itemList ?? []
    }
    
    func fetchItemList() {
        webserviceManager.callItemListService({ itemsResponse in
            self.dataItem = itemsResponse
            self.delegate?.getItemList(itemsResponse.itemList, nil)
        }, { error in
             self.delegate?.getItemList(nil, error)
        })
    }

}
