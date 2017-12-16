//
//  AuthService.swift
//  Breakpoint
//
//  Created by Osama on 16/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class AuthService {
    static var instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userRegistrationComplete: @escaping CompletionHandler){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                userRegistrationComplete(false, error)
                return
            }
            
            let userData = [PROVIDER_KEY: user!.providerID,
                            EMAIL_KEY: user!.email!]
            
            DataService.instance.createNewUser(uid: user!.uid, userData: userData)
            
            userRegistrationComplete(true, nil)
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, userLoginComplete: @escaping CompletionHandler){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                userLoginComplete(false, error)
                return
            }
            
            userLoginComplete(true, nil)
        }
    }
}
