//
//  UserCell.swift
//  Breakpoint
//
//  Created by Osama on 18/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool){
        
        self.profileImage.image = image
        emailLabel.text = email
        
        if isSelected {
            self.checkImage.isHidden = false
        }else{
            self.checkImage.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
}
