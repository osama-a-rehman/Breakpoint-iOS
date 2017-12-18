//
//  ProfileVC.swift
//  Breakpoint
//
//  Created by Osama on 17/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = Auth.auth().currentUser!.email
    }

    @IBAction func btnLogoutPressed(_ sender: AnyObject) {
        let logoutPopUp = UIAlertController(title: "Logout", message: "Are you sure you want to Logout ?", preferredStyle: .alert)
        
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }catch {
                print(error)
            }
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        logoutPopUp.addAction(logoutAction)
        logoutPopUp.addAction(cancelAction)
        
        present(logoutPopUp, animated: true, completion: nil)
    }
}
