//
//  ProfileVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

  @IBOutlet weak var profileImg: CircleImage!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userEmail: UILabel!
  @IBOutlet weak var bgView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
  }
  
  func setUpView() {
    userName.text = UserDataService.instance.name
    userEmail.text = UserDataService.instance.email
    profileImg.image = UIImage(named: UserDataService.instance.imgName)
    profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.imgColor)
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
    bgView.addGestureRecognizer(closeTouch)
  }
  
  // close modal by tab
  @objc func closeTap (_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  // close modal
  @IBAction func closeModalClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  // logout
  @IBAction func btnLogoutClick(_ sender: Any) {
    UserDataService.instance.logOut()
    NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
    dismiss(animated: true, completion: nil)
  }
  
}
