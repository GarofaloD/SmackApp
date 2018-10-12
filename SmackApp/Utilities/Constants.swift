//
//  Constants.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

//Renaming types. This is useful because we can create an alias for whatever type with a closure
typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://devslopeschatdaniel.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"



//Segues
let GO_TO_LOGIN = "goToLogin"
let GO_TO_CREATE_ACCOUNT = "goToCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
