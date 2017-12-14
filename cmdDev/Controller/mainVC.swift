//
//  mainVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class mainVC: UIViewController {

  @IBOutlet weak var btnMenu: UIButton!
  @IBOutlet weak var categoryNameLbl: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(
      self.revealViewController(),
      action: #selector(SWRevealViewController.revealToggle(_:)),
      for: .touchUpInside
    )
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
    NotificationCenter.default.addObserver(self, selector: #selector(mainVC.userDataChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(mainVC.categorySelected(_:)), name: NOTIF_CATEGORY_SELECTED, object: nil)
    
    if AuthService.instance.isLogggedIn {
      AuthService.instance.findUserByEmail(completion: { (success) in
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
      })
    }
    
  }
  
  @objc func userDataChange (_ notif: Notification) {
    if AuthService.instance.isLogggedIn {
      // get category
      onLoginGetMessage()
    } else {
      categoryNameLbl.text = "Please Log In"
    }
  }
  
  @objc func categorySelected (_ notif: Notification) {
    updateWithCategory()
  }
  
  func updateWithCategory () {
    let categoryName = DataService.instance.selectedCategory?.categoryName ?? ""
    categoryNameLbl.text = "CmdDev #\(categoryName)"
  }
  
  func onLoginGetMessage () {
    DataService.instance.findAllCategory { (success) in
      if success {
        
      }
    }
  }
  
}
