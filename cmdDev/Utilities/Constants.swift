//
//  Constants.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation

typealias CompletionHandeler = (_ Success: Bool) -> ()

// heroku url
let BASE_URL = "https://cmddev.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"

// segues
let ToLogin = "toLogin"
let ToRegister = "toRegister"
let Unwind = "unwindToNav"

// user defalts
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// http header
let HTTP_HEADER = [
  "Content-Type": "application/json; charset=utf-8"
]
