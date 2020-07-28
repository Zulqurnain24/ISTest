//
//  ViewController.swift
//  ISTest
//
//  Created by macbook on 26/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    //UI Components
    @IBOutlet weak var userNameTextfield: CustomTextfieldView!
    
    @IBOutlet weak var passwordTextfield: CustomTextfieldView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: CustomButton!
    
    //View model object
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        viewModel?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clearToken()
    }
    
    func clearToken() {
        PersistentStoreManager.shared.clearData(uniqueId: "", StringConstants.token.rawValue)
    }
    
    func performSegueToItemsScreen() {
        self.performSegue(withIdentifier: StringConstants.segueToItemsScreen.rawValue, sender: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard  !userNameTextfield.text.isEmpty
               &&
               !passwordTextfield.text.isEmpty
        else {
            CommonFunctionality.showGeneralAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.fillFields.rawValue, okCallback: nil, cancelCallback: nil)
            return }
        viewModel?.getToken(userNameTextfield.text, passwordTextfield.text)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func getToken(_ token: String?, _ error: String?) {
        guard error == nil
        else {
            CommonFunctionality.showGeneralAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.unableToAuthenticate.rawValue, okCallback: nil, cancelCallback: nil)
            return
        }
        
        PersistentStoreManager.shared.setObject(uniqueId: "", key: StringConstants.token.rawValue, value: Token(token: token, timestamp: Date()))
        performSegueToItemsScreen()
    }
}
