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
  
  // conver background color string
  func returnUIColor(components: String) -> UIColor {
    // "[0.607843137254902, 0.592156862745098, 0.443137254901961, 1]"
    let scanner = Scanner(string: components)
    let skipped = CharacterSet(charactersIn: "[], ")
    let comma = CharacterSet(charactersIn: ",")
    scanner.charactersToBeSkipped = skipped
    
    var r, g, b, a : NSString?
    scanner.scanUpToCharacters(from: comma, into: &r)
    scanner.scanUpToCharacters(from: comma, into: &g)
    scanner.scanUpToCharacters(from: comma, into: &b)
    scanner.scanUpToCharacters(from: comma, into: &a)
    
    let defaultColor = UIColor.lightGray
    
    guard let rUnrapped = r else { return defaultColor}
    guard let gUnrapped = g else { return defaultColor}
    guard let bUnrapped = b else { return defaultColor}
    guard let aUnrapped = a else { return defaultColor}
    
    let rfloat = CGFloat(rUnrapped.doubleValue)
    let gfloat = CGFloat(gUnrapped.doubleValue)
    let bfloat = CGFloat(bUnrapped.doubleValue)
    let afloat = CGFloat(aUnrapped.doubleValue)
    
    let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
    
    return newUIColor
  }
  
}
