//
//  GroupsVC.swift
//  Breakpoint
//
//  Created by Osama on 03/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var groupsTableView: UITableView!
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupsTableView.delegate = self
        groupsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.REF_GROUPS.observe(.value, with: { (snapshot) in
        
            DataService.instance.getGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupsTableView.reloadData()
            }
            
        })
        
        
    }

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL_IDENTIFIER) as? GroupCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(title: groupsArray[indexPath.row].title, description: groupsArray[indexPath.row].description, memberCount: groupsArray[indexPath.row].memberCount)
        
        return cell
    }
}
