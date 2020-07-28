//
//  SplashViewController.swift
//  ISTest
//
//  Created by macbook on 26/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class SplashScreenViewController: BaseViewController {

    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1..<8 {
            animationView.animationImages.append(UIImage(named:"Splash_Animation_\(i)") ?? #imageLiteral(resourceName: "image"))
        }
        animationView.animationDuration = config.animationTime
        animationView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + config.animationTime, execute: {
            self.performSegueToLoginScreen()
        })
    }

    func performSegueToLoginScreen() {
        self.performSegue(withIdentifier: "segueToLoginScreen", sender: nil)
    }
}
