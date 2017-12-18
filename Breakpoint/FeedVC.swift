//
//  FeedVC.swift
//  Breakpoint
//
//  Created by Osama on 03/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class FeedVC: UIViewController {

    @IBOutlet weak var feedsTableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            
            self.messageArray = returnedMessagesArray.reversed()
            self.feedsTableView.reloadData()
            
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FEED_CELL_IDENTIFIER) as? FeedCell else {
            return UITableViewCell()
        }
        
        let senderId = messageArray[indexPath.row].senderId
        let messageContent = messageArray[indexPath.row].msgContent
        
        DataService.instance.getEmail(forUID: senderId) { (email) in
            
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage.jpg")!, userEmail: email, messageContent: messageContent)
        }
        
        return cell
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
}
