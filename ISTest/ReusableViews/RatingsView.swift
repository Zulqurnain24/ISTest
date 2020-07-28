//
//  FancyLoaderView.swift
//  ISTest
//
//  Created by macbook on 18/06/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class RatingsView: UIView {
    let kCONTENT_XIB_NAME = "RatingsView"
    var view: UIView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    var imageViewArray = [UIImageView]()
    
    @IBInspectable var rating: Int {
         set {
            for i in 0..<newValue {
                imageViewArray[i].image = #imageLiteral(resourceName: "redStar")
                imageViewArray[i].contentMode = .scaleAspectFit
                imageViewArray[i].isHidden = false
                imageViewArray[i].setNeedsDisplay()
            }
         }
         get {
            return imageViewArray.filter({$0.isHidden == true}).count
         }
     }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        xibSetup()
        configUI()
        populateImageArray()
    }
    
    func populateImageArray() {
        imageViewArray.append(contentsOf: [imageView1, imageView2, imageView3, imageView4, imageView5])
        imageViewArray.forEach({$0.isHidden = true})
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)

        xibSetup()
        configUI()
        populateImageArray()
    }

    func configUI() {
        view.cornerRadius = 8
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
