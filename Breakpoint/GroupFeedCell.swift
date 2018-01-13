//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Osama on 14/01/2018.
//  Copyright © 2018 Osama. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var messageContentLabel: UILabel!

    func configureCell(profileImage: UIImage, userEmail: String, messageContent: String){
        
        self.profileImage = UIImageView(image: profileImage)
        self.userEmailLabel.text = userEmail
        self.messageContentLabel.text = messageContent
    }
}
