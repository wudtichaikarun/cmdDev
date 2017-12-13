//
//  UserDataService.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation

class UserDataService {
  static let instance = UserDataService()
  
  public private(set) var id = ""
  public private(set) var imgName = ""
  public private(set) var imgColor = ""
  public private(set) var email = ""
  public private(set) var name = ""
  
  func setUserData (id: String, imgName: String, imgColor: String, email: String, name: String) {
    self.id = id
    self.imgName = imgName
    self.imgColor = imgColor
    self.email = email
    self.name = name
  }
  
  func setProfileImg (imgName: String) {
    self.imgName = imgName
  }
}
