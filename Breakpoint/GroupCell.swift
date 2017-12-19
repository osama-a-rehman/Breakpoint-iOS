//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Osama on 19/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupMembers: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int){
        groupTitle.text = title
        groupDescription.text = "  \(description)"
        groupMembers.text = "  _members: \(memberCount)"
    }
}
