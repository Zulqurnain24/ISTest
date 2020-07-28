//
//  AnimationView.swift
//  AdornAR
//
//  Created by macbook on 16/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class AnimationView: UIView {
    let kCONTENT_XIB_NAME = "AnimationView"
    var view: UIView!

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var animationImages: [UIImage] {
         set {
             self.imageView.animationImages = newValue
         }
         get {
            return self.imageView.animationImages ?? []
         }
     }
    
    @IBInspectable var animationDuration: Double {
        set {
            imageView.animationDuration = newValue
        }
        get {
            return imageView.animationDuration
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        xibSetup()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        xibSetup()
        setupView()
    }

    func setupView() {
        self.backgroundColor = UIColor.clear
        imageView.backgroundColor = UIColor.clear
    }
    
    func startAnimating() {
        imageView.startAnimating()
    }
    
    func stopAnimating() {
        imageView.stopAnimating()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
       addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: kCONTENT_XIB_NAME, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
}
