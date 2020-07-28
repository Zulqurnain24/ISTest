//
//  MyActivityCell.swift
//  
//
//  Created by Mohammad Zulqurnain 10/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        CommonFunctionality.setShadow(view, intensity: 0.2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
