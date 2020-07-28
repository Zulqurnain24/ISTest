//
//  VehiclesViewModel.swift
//
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class {
    func getToken(_ token: String?, _ error: String?)
}

class LoginViewModel {
    private let webserviceManager = WebserviceManager()
    private var dataItem: AuthResponse?
    weak var delegate: LoginViewModelDelegate?

    func getToken(_ userName: String, _ password: String) {
        webserviceManager.callAuthService(userName, password, { authResponse in
            self.delegate?.getToken(authResponse.token, nil)
        }) { error in
            self.delegate?.getToken(nil, error)
        }
    }

}
