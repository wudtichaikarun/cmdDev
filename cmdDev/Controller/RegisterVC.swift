//
//  RegisterVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
  @IBOutlet weak var userNameText: UITextField!
  
  @IBOutlet weak var emailText: UITextField!
  
  @IBOutlet weak var passwordText: UITextField!
  
  @IBOutlet weak var profileImg: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func btnClose(_ sender: Any) {
    performSegue(withIdentifier: Unwind, sender: nil)
  }
  
  @IBAction func chooseImg(_ sender: Any) {
  }
  
  @IBAction func btnRegisterClick(_ sender: Any) {
    guard let email = emailText.text, emailText.text != "" else { return }
    guard let password = passwordText.text, passwordText.text != "" else { return }
    
    AuthService.instance.register(email: email, password: password) { (success) in
      if success {
        print("register success")
      }
    }
    
  }
  
}
