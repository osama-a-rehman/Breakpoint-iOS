//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Osama on 16/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: InsetTextField!
    
    @IBOutlet weak var passwordTextField: InsetTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(recognizer:)))
        viewTap.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(viewTap)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func btnClosePressed(_ sender: AnyObject) {
        self.view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnSignInPressed(_ sender: AnyObject) {
        
        if let email = emailTextField.text , let password = passwordTextField.text{
            AuthService.instance.loginUser(withEmail: email, andPassword: password, userLoginComplete: { (success, error) in
                
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("Login Successful")
                }else {
                    print("Error Loging at first")
                    print(error?.localizedDescription)
                }
                
                AuthService.instance.registerUser(withEmail: email, andPassword: password, userRegistrationComplete: { (success, error) in
                    
                    if success {
                        
                        AuthService.instance.loginUser(withEmail: email, andPassword: password, userLoginComplete: { (success, nil) in
                            
                            print("Registration Successful with Login")
                            
                            self.dismiss(animated: true, completion: nil)
                        })
                    }else{
                        print(error?.localizedDescription)
                    }
                
                })
            })
        }
    }

    func viewTapped(recognizer: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
