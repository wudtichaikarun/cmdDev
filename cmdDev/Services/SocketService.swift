//
//  SocketService.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
  
  static let instance = SocketService()
  
  override  init() {
    super.init()
  }
  
  var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
  
  func establishConnection () {
    socket.connect()
  }
  
  func closeConnection () {
    socket.disconnect()
  }
  
  func addCategory (categoryName: String, completion: @escaping CompletionHandeler) {
    socket.emit("newCategory", categoryName)
    completion(true)
  }
  
  func getCategory(completion: @escaping CompletionHandeler) {
    socket.on("categoryCreate") {
      (dataArray, ack) in
      guard let categoryName = dataArray[0] as? String else { return }
      guard let categoryId = dataArray[1] as? String else { return }
      
      let newCategory = Category(categoryName: categoryName, categoryId: categoryId)
      DataService.instance.categorys.append(newCategory)
      completion(true)
    }
  }
  
  func addCommand(cmdKey: String, cmdDescription: String, categoryId: String, completion: @escaping CompletionHandeler) {
    let userCreateId = UserDataService.instance.id
    socket.emit("newCommand", cmdKey, cmdDescription, categoryId, userCreateId)
    completion(true)
  }
  
  func getCommandMassage(completion : @escaping CompletionHandeler) {
    socket.on("commandCreate") { (dataArray, ack) in
      guard let cmdKey = dataArray[0] as? String else { return }
      guard let cmdDescription = dataArray[1] as? String else { return }
      guard let categoryId = dataArray[2] as? String else { return }
      guard let userCreateId = dataArray[3] as? String else { return }
      guard let _id = dataArray[4] as? String else { return }
      
      if categoryId == DataService.instance.selectedCategory?.categoryId && AuthService.instance.isLogggedIn {
        let newMassage = Command(cmdId: _id, cmdKey: cmdKey, cmdDescription: cmdDescription, categoryId: categoryId, userCreateId: userCreateId)
        
        DataService.instance.commands.append(newMassage)
        completion(true)
        
      } else {
        completion(false)
      }
    }
  }
  
}
