//
//  DataService.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
  
  static let instance = DataService()
  
  var categorys = [Category]()
  var selectedCategory : Category?
  
  func findAllCategory (completion: @escaping CompletionHandeler) {
    Alamofire.request(CATEGORY_GET_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER_WITH_TOKEN).responseJSON { (response) in
      if response.result.error == nil {
        guard let data = response.data else { return }
        if let json = JSON(data: data).array {
          for res in json {
            let catName = res["name"].stringValue
            let id = res["_id"].stringValue
            let category = Category(categoryName: catName, categoryId: id)
            
            self.categorys.append(category)
          }
          //print(self.categorys[0].categoryName)
          NotificationCenter.default.post(name: NOTIF_CATEGORY_LOADED, object: nil)
          completion(true)
        }
        
      } else {
        debugPrint(response.result.error as Any)
      }
    }
  }
  
  func clearCategory () {
    categorys.removeAll()
  }
  
}
