//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Osama on 18/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var messageContent: UILabel!
    
    func configureCell(profileImage: UIImage, userEmail: String, messageContent: String){
        
        self.profileImage = UIImageView(image: profileImage)
        self.userEmail.text = userEmail
        self.messageContent.text = messageContent
        
    }
}
