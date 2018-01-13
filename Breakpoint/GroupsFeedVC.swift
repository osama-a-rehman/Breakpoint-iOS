//
//  GroupsFeedVC.swift
//  Breakpoint
//
//  Created by Osama on 14/01/2018.
//  Copyright © 2018 Osama. All rights reserved.
//

import UIKit
import FirebaseAuth

class GroupsFeedVC: UIViewController {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var feedsTableView: UITableView!
    
    @IBOutlet weak var sendBtnView: UIView!
    
    @IBOutlet weak var messageTextField: InsetTextField!
    
    @IBOutlet weak var btnSend: UIButton!
    
    private var group: Group?
    var groupMessages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedsTableView.delegate = self
        feedsTableView.dataSource = self
        
        sendBtnView.bindToKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        groupNameLabel.text = group!.title
        
        DataService.instance.REF_GROUPS.observe(.value, with: { (snapshot) in
            DataService.instance.getAllFeedMessagesFor(desiredGroup: self.group!) { (returnedMessages) in
                self.groupMessages = returnedMessages
                self.feedsTableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.feedsTableView.scrollToRow(at: IndexPath.init(row: self.groupMessages.count-1, section: 0), at: .none, animated: true)
                }
            }
        })
    }
    
    func initGroup(forGroup group: Group){
        self.group = group
    }
    
    @IBAction func btnSendPressed(_ sender: AnyObject) {
        if messageTextField.text != nil && messageTextField.text!.caseInsensitiveCompare("Enter a text...") != ComparisonResult.orderedSame && messageTextField.text != "" {
            
            btnSend.isEnabled = false
            
            let uid = (Auth.auth().currentUser?.uid)!
            
            DataService.instance.createPost(withMessage: messageTextField.text!, forUID: uid, withGroupKey: group!.id, completion: { (success) in
                
                if success {
                    print("Group Post uploaded successfully")
                    self.messageTextField.text = ""
                    self.btnSend.isEnabled = true
                    self.view.endEditing(true)
                    self.feedsTableView.reloadData()
                    //self.dismiss(animated: true, completion: nil)
                }
            })
            
        }
    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismissDetail()
    }
}

extension GroupsFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Messages: \(groupMessages.count)")
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = feedsTableView.dequeueReusableCell(withIdentifier: GROUP_FEED_CELL_IDENTIFIER) as? GroupFeedCell else {
            
            //print("Invalid CELL")
            
            return UITableViewCell()
        }
       
        let senderId = groupMessages[indexPath.row].senderId
        let messageContent = groupMessages[indexPath.row].msgContent
        
        DataService.instance.getEmail(forUID: senderId) { (email) in
            
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage.jpg")!, userEmail: email, messageContent: messageContent)
        }
        
        //print("Correct CELL")
        
        return cell
    }
}
