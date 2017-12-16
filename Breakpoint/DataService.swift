//
//  DataService.swift
//  Breakpoint
//
//  Created by Osama on 08/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import Foundation
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    static var instance = DataService()
    
    private let _REF_BASE = DB_BASE
    private let _REF_USERS = DB_BASE.child("users")
    private let _REF_GROUPS = DB_BASE.child("groups")
    private let _REF_FEEDS = DB_BASE.child("feeds")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEEDS: DatabaseReference {
        return _REF_FEEDS
    }
    
    func createNewUser(uid: String, userData: Dictionary<String, Any>){
       REF_USERS.child(uid).updateChildValues(userData)
    }
}
