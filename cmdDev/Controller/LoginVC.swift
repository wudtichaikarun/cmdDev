//
//  LoginVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func btnClose(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func btnRegisterClick(_ sender: Any) {
    performSegue(withIdentifier: ToRegister, sender: nil)
  }
  
}
