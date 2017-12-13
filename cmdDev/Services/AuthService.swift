//
//  AuthService.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
  
  static let instance = AuthService()
  
  let defaults = UserDefaults.standard
  
  var isLogggedIn : Bool {
    get {
      return defaults.bool(forKey: LOGGED_IN_KEY)
    }
    set {
      defaults.set(newValue, forKey: LOGGED_IN_KEY)
    }
  }
  
  var authToken: String {
    get {
      return defaults.value(forKey: TOKEN_KEY) as! String
    }
    set {
      defaults.set(newValue, forKey: TOKEN_KEY)
    }
  }
  
  var userEmail: String {
    get {
      return defaults.value(forKey: USER_EMAIL) as! String
    }
    set {
      defaults.set(newValue, forKey: USER_EMAIL)
    }
  }
  
  func register (email: String, password: String, completion: @escaping CompletionHandeler) {
    let lowerCaseEmail = email.lowercased()
    
    let body: [String: Any] = [
      "email": lowerCaseEmail,
      "password": password
    ]
    
    Alamofire.request(
      REGISTER_URL,
      method: .post,
      parameters: body,
      encoding: JSONEncoding.default,
      headers: HTTP_HEADER
      ).responseString { (response) in
        if response.result.error == nil {
          completion(true)
        } else {
          completion(false)
          debugPrint(response.result.error as Any)
        }
    }
    
  }
  
  func login (email: String, password: String, completion: @escaping CompletionHandeler) {
    let lowerCaseEmail = email.lowercased()
    
    let body: [String: Any] = [
      "email": lowerCaseEmail,
      "password": password
    ]
    
    Alamofire.request(
      LOGIN_URL,
      method: .post,
      parameters: body,
      encoding: JSONEncoding.default,
      headers: HTTP_HEADER
      ).responseJSON { (response) in
        if response.result.error == nil {
          /*
          if let json = response.result.value as? Dictionary<String, Any> {
              if let email = json["user"] as? String {
                self.userEmail = email
              }
              if let token = json["token"] as? String {
                self.authToken = token
              }
            }
          */
          
          // using SwiftyJSON
          guard let data = response.data else { return }
          let json = JSON(data: data)
          self.userEmail = json["user"].stringValue
          self.authToken = json["token"].stringValue
          
          self.isLogggedIn = true
          completion(true)
        } else {
          completion(false)
          debugPrint(response.result.error as Any)
        }

    }
    
  }
  
}
