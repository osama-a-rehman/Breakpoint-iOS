//
//  CreateGroupVC.swift
//  Breakpoint
//
//  Created by Osama on 18/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    var emailsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
    }

    
    @IBAction func btnClosePressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnDonePressed(_ sender: AnyObject) {
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
        
        cell.configureCell(profileImage: UIImage(named: "defaultProfileImage.jpg")!, email: emailsArray[indexPath.row], isSelected: true)
        
        return cell
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
