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
//let BASE_URL = "https://cmddev.herokuapp.com/v1/"
let BASE_URL = "https://cmddev.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"
let USER_ADD_URL = "\(BASE_URL)user/add"
let USER_BY_EMAIL_URL = "\(BASE_URL)user/byEmail/"
let CATEGORY_GET_URL = "\(BASE_URL)category/"
let COMMAND_GET_URL = "\(BASE_URL)command/byCategory/"

// segues
let ToLogin = "toLogin"
let ToRegister = "toRegister"
let Unwind = "unwindToNav"
let ToImagePicker = "toImagePicker"

// user defalts
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// notification
let NOTIF_USER_DATA_CHANGE = Notification.Name("notifUserDataChange")
let NOTIF_CATEGORY_LOADED = Notification.Name("categorysLoaded")
let NOTIF_CATEGORY_SELECTED = Notification.Name("categorySelected")

// http header
let HTTP_HEADER = [
  "Content-Type": "application/json; charset=utf-8"
]
let HEADER_WITH_TOKEN = [
  "Authorization": "Bearer \(AuthService.instance.authToken)",
  "Content-Type": "application/json; charset=utf-8"
]
