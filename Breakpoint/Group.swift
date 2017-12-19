//
//  Group.swift
//  Breakpoint
//
//  Created by Osama on 19/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import Foundation

class Group {
    private var _id: String
    private var _title: String
    private var _description: String
    private var _memberCount: Int
    private var _membersArray: [String]
    
    var id: String {
        return _id
    }
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var membersArray: [String] {
        return _membersArray
    }
    
    init(_id: String, _title: String, _description: String, _memberCount: Int, _membersArray: [String]) {
        self._id = _id
        self._title = _title
        self._description = _description
        self._memberCount = _memberCount
        self._membersArray = _membersArray
    }
}
