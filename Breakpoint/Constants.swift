//
//  Constants.swift
//  Breakpoint
//
//  Created by Osama on 16/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ status: Bool,_ error: Error?) -> ()

typealias PostCompletionHandler = (_ status: Bool) -> ()

typealias MessageCompletionHandler = (_ messages: [Message]) -> ()


// USER REGISTRATION DICTIONARY KEYS
let PROVIDER_KEY: String = "provider"
let EMAIL_KEY: String = "email"

// POST CREATION DICTIONARY KEYS
let MESSAGE_KEY: String = "message"
let UID_KEY: String = "uid"

// POST CREATION DICTIONARY KEYS
let TITLE_KEY: String = "title"
let DESCRIPTION_KEY: String = "description"
let GROUP_MEMBERS_KEY: String = "members"

// REUSE IDENTIFIERS
let FEED_CELL_IDENTIFIER = "FeedCell"
let USER_CELL_IDENTIFIER = "UserCell"
let GROUP_CELL_IDENTIFIER = "GroupCell"
