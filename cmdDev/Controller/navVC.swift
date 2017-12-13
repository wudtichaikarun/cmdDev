//
//  navVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class navVC: UIViewController {

  @IBOutlet weak var btnLogin: UIButton!
  @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
  @IBOutlet weak var userImage: CircleImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    NotificationCenter.default.addObserver(self, selector: #selector(navVC.userDataChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    setUpUserInfo()
  }
  
  @objc func userDataChange(_ notif: Notification) {
    setUpUserInfo()
  }

  @IBAction func btnLoginClick(_ sender: Any) {
    if AuthService.instance.isLogggedIn {
      let profile = ProfileVC()
      profile.modalPresentationStyle = .custom
      present(profile, animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: ToLogin, sender: nil)
    }

  }
  
  func setUpUserInfo() {
    if AuthService.instance.isLogggedIn {
      btnLogin.setTitle(UserDataService.instance.name, for: .normal)
      userImage.image = UIImage(named: UserDataService.instance.imgName)
      userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.imgColor)
    } else {
      btnLogin.setTitle("Login", for: .normal)
      userImage.image = UIImage(named: "menuProfileIcon")
      userImage.backgroundColor = UIColor.clear
    }
  }
  
  
}
