//
//  CustomTextfield.swift
//  ISTest
//
//  Created by Mohammad Zulqurnain 07/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

enum FieldType {
    case normal
    case password
    case email
}

protocol CustomTextfieldViewDelegate {
    func setupDelegate()
    
    func xibSetup()
    
    func loadViewFromNib() -> UIView
    
    func configUI()
    
    func textFieldColorsToHighlight()
    
    func textFieldColorsToLight()
}

@IBDesignable class CustomTextfieldView: UIView, CustomTextfieldViewDelegate {
    @IBOutlet weak var line: UIView!
    let kCONTENT_XIB_NAME = "CustomTextfieldView"
    
    var view: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var textfield: UITextField!

    var text: String {
        set {
            self.textfield.text = newValue
        }
        get {
            return textfield.text ?? ""
        }
    }
    
    @IBInspectable var placeholder: String {
        set {
            self.textfield.placeholder = newValue
        }
        get {
            return textfield.placeholder ?? ""
        }
    }

    @IBInspectable var isSecure: Bool = false {
        didSet {
            textfield.isSecureTextEntry = isSecure
        }
    }

    var errorCallback: ((UILabel) -> Void)?
    
    private var regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    @IBInspectable var regexPattern: String = "" {
        didSet {
            regex = regexPattern
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)

        xibSetup()
        configUI()
        setupDelegate()
    }
    
    func setupDelegate() {
       textfield.addTarget(self, action: #selector(textFieldDidChangeSelection), for: .editingChanged)
       textfield.delegate = self
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
    
    func configUI() {
        leftImageView.isHidden = false
        rightImageView.isHidden = false
 
        textfield.font = Fonts.textfield
        label.font = Fonts.label
        errorLabel.font = Fonts.errorLabel
        
        line.layer.backgroundColor = clearColor.cgColor
        textfield.textColor = blackColor
    }
    
    func textFieldColorsToHighlight() {
        line.layer.backgroundColor = redColor.cgColor
        textfield.tintColor = blackColor
        textfield.textColor = blackColor
    }

    func textFieldColorsToLight() {
          line.layer.backgroundColor = clearColor.cgColor
          textfield.tintColor = blackColor
          textfield.textColor = blackColor
    }
}

extension CustomTextfieldView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldColorsToHighlight()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldColorsToLight()
    }
    
    internal func textFieldDidChangeSelection(_ textField: UITextField) {

        textFieldDidBeginEditing(textField)
        
        guard  CommonFunctionality.passRegex(regex: regex , string: text)
        else {
            self.errorLabel.isHidden = false
            errorCallback?(self.label)
            return
        }

        self.errorLabel.isHidden = true
        return
    }
}
