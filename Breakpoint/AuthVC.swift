//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Osama on 16/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnLoginWithFbPressed(_ sender: AnyObject) {
    }
    
    
    @IBAction func btnLoginWithGooglePressed(_ sender: AnyObject) {
    }
    
    
    @IBAction func btnLoginWithEmailPressed(_ sender: AnyObject) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        present(loginVC!, animated: true, completion: nil)
    }
}