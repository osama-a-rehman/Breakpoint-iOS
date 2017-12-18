//
//  Message.swift
//  Breakpoint
//
//  Created by Osama on 18/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import Foundation

class Message {
    private var _msgContent: String
    private var _senderId: String
    
    var msgContent: String {
        return _msgContent
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(msgContent: String, senderId: String) {
        self._msgContent = msgContent
        self._senderId = senderId
    }
}
