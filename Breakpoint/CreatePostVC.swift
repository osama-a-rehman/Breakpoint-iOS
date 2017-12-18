//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Osama on 17/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class CreatePostVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var btnSend: BorderedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTextView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(recognizer:)))
        
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        btnSend.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = Auth.auth().currentUser!.email
    }
    
    @IBAction func btnClosePressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnSendPressed(_ sender: AnyObject) {
        if messageTextView.text != nil && messageTextView.text.caseInsensitiveCompare("Say something here...") != ComparisonResult.orderedSame && messageTextView.text != "" {
            
            btnSend.isEnabled = false
            
            let uid = (Auth.auth().currentUser?.uid)!
            
            DataService.instance.createPost(withMessage: messageTextView.text!, forUID: uid, withGroupKey: nil, completion: { (success) in
                
                if success {
                    print("Post uploaded successfully")
                    self.btnSend.isEnabled = true
                    self.view.endEditing(true)
                    self.dismiss(animated: true, completion: nil)
                }
            })
            
        }
    }
    
    func viewTapped(recognizer: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTextView.text != nil && messageTextView.text.caseInsensitiveCompare("Say something here...") == ComparisonResult.orderedSame {
            
            messageTextView.text = ""
        }
    }
}
