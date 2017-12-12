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
let urlBase = "https://cmddev.herokuapp.com/v1/"
let urlRegister = "\(urlBase)account/register"

// segues
let ToLogin = "toLogin"
let ToRegister = "toRegister"
let Unwind = "unwindToNav"

// user defalts
let tokenKey = "token"
let loggedInKey = "loggedIn"
let userMail = "userEmail"
