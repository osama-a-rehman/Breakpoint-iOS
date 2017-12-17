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

// USER REGISTRATION DICTIONARY KEYS
let PROVIDER_KEY: String = "provider"
let EMAIL_KEY: String = "email"

// POST CREATION DICTIONARY KEYS
let MESSAGE_KEY: String = "message"
let UID_KEY: String = "uid"
