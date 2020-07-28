//
//  DetailViewController.swift
//  ISTest
//
//  Created by macbook on 28/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //View model object
    var viewModel = ItemDetailViewModel()
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!

    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var ratingView: RatingsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateUI()
    }
    
    func populateUI() {
        itemNameLabel.text = viewModel.getItem()?.name
        itemDescriptionLabel.text = viewModel.getItem()?.description
        itemPriceLabel.text = "\(StringConstants.price.rawValue) \(viewModel.getItem()?.price ?? 0.0)"
        ratingView.rating = viewModel.getItem()?.itemRate ?? 0
    }

}
