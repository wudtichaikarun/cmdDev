//
//  AuthService.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
  
  static let instance = AuthService()
  
  let defaults = UserDefaults.standard
  
  var isLogggedIn : Bool {
    get {
      return defaults.bool(forKey: loggedInKey)
    }
    set {
      defaults.set(newValue, forKey: loggedInKey)
    }
  }
  
  var authToken: String {
    get {
      return defaults.value(forKey: tokenKey) as! String
    }
    set {
      defaults.set(newValue, forKey: tokenKey)
    }
  }
  
  func register (email: String, password: String, completion: @escaping CompletionHandeler) {
    let lowerCaseEmail = email.lowercased()
    
    let header = [
      "Content-Type": "application/json; charset=utf-8"
    ]
    
    let body: [String: Any] = [
      "email": lowerCaseEmail,
      "password": password
    ]
    
    Alamofire.request(
      urlRegister,
      method: .post,
      parameters: body,
      encoding: JSONEncoding.default,
      headers: header
    ).responseString { (response) in
        if response.result.error == nil {
          completion(true)
        } else {
          completion(false)
          debugPrint(response.result.error as Any)
        }
    }
  }
  
}
