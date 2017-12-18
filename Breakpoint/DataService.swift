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
    
    func createPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, completion: @escaping PostCompletionHandler){
        
        if groupKey != nil {
            // manage group reference
        }else{
            let feedData = [MESSAGE_KEY: message, UID_KEY: uid]
            
            REF_FEEDS.childByAutoId().updateChildValues(feedData)
            
            completion(true)
        }
    }
    
    func getAllFeedMessages(completion: @escaping MessageCompletionHandler){
        
        REF_FEEDS.observeSingleEvent(of: .value, with: { (feedMessageSnapshot) in
            
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            var messageArray = [Message]()
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: MESSAGE_KEY).value as! String
                
                let senderId = message.childSnapshot(forPath: UID_KEY).value as! String
                
                let message = Message(msgContent: content, senderId: senderId)
                
                messageArray.append(message)
            }
            
            completion(messageArray)
        })
    }
    
    func getEmail(forUID uid: String, completion: @escaping (_ email: String) -> ()){
        REF_USERS.observeSingleEvent(of: .value, with: { (userSnapshot) in
            
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            for user in userSnapshot {
                if user.key == uid {
                    let email = user.childSnapshot(forPath: EMAIL_KEY).value as! String
                    
                    completion(email)
                    return
                }
            }
        })
    }
}
