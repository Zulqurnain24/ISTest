//
//  CustomButton.swift
//  ISTest
//
//  Created by Mohammad Zulqurnain 06/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

protocol CustomButtonDelegate {
    func setupButton()

    func setShadow()
    
    func setFont()
    
    func configUI()
    
}

class CustomButton: UIButton, CustomButtonDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        configUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        configUI()
    }

    func setupButton() {
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = redColor
        titleLabel?.font     = UIFont(name: "Poppins-Semibold", size: 18)
        layer.cornerRadius   = frame.size.width/2
        layer.borderWidth    = 0.0
        layer.borderColor    = blackColor.cgColor
        
        let spacing = CGFloat(30.0) // the amount of spacing to appear between image and title
        self.imageEdgeInsets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
    }

    internal func setShadow() {
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.5)
        layer.shadowRadius  = 5.0
        layer.shadowOpacity = 0.3
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    func setFont() {
        self.titleLabel?.font = Fonts.button
    }
    
    func configUI() {
        setShadow()
        setupButton()
        setFont()
    }
    
}
