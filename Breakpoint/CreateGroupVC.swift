//
//  CreateGroupVC.swift
//  Breakpoint
//
//  Created by Osama on 18/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateGroupVC: UIViewController {

    
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    var chosenUsersArray = [String]()
    
    var emailsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnDone.isHidden = true
    }
    
    @IBAction func btnClosePressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnDonePressed(_ sender: AnyObject) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getUserIds(forEmails: chosenUsersArray, completion: { (chosenUsersIds) in
                
                    var tempUserIdsArray = chosenUsersIds
                
                    tempUserIdsArray.append(Auth.auth().currentUser!.uid)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, withUserIds: tempUserIdsArray, completion: { (success) in
                
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    }else{
                        print("Group creation failed")
                    }
                    
                })
                
            })
        }
    }

}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: USER_CELL_IDENTIFIER) as? UserCell else {
            return UITableViewCell()
        }
        
        if chosenUsersArray.contains(emailsArray[indexPath.row]) {
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage.jpg")!, email: emailsArray[indexPath.row], isSelected: true)
        }else{
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage.jpg")!, email: emailsArray[indexPath.row], isSelected: false)
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {
            return
        }
        
        if !chosenUsersArray.contains(cell.emailLabel.text!) {
            chosenUsersArray.append(cell.emailLabel.text!)
            
            groupMembersLabel.text = chosenUsersArray.joined(separator: ", ")
            
            btnDone.isHidden = false
        }else{
            chosenUsersArray = chosenUsersArray.filter({ $0 != cell.emailLabel.text! })
            
            if chosenUsersArray.count > 0 {
                groupMembersLabel.text = chosenUsersArray.joined(separator: ", ")
                btnDone.isHidden = false
            }else{
                groupMembersLabel.text = "Add people to your group"
                btnDone.isHidden = true
            }
        }
    }
}

extension CreateGroupVC: UITextFieldDelegate {
    func textFieldDidChange(){
        if emailSearchTextField.text == "" {
            emailsArray = []
            usersTableView.reloadData()
        }else {
            DataService.instance.getEmails(forSearchQuery: emailSearchTextField.text!, completion: { (emails) in
                
                self.emailsArray = emails
                self.usersTableView.reloadData()
            })
        }
    }
}
