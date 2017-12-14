//
//  LoginVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

  @IBOutlet weak var userNameText: UITextField!
  @IBOutlet weak var passwordText: UITextField!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    spinner.isHidden = true
    let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
    view.addGestureRecognizer(tap)
  }

  // close keyboard
  @objc func handleTap() {
    view.endEditing(true)
  }

  @IBAction func btnClose(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func btnRegisterClick(_ sender: Any) {
    performSegue(withIdentifier: ToRegister, sender: nil)
  }
  
  @IBAction func BtnLoginClick(_ sender: Any) {
    spinner.isHidden = false
    spinner.startAnimating()
    
    guard let userEmail = userNameText.text, userNameText.text != "" else { return }
    guard let passWord = passwordText.text, passwordText.text != "" else { return }
    AuthService.instance.login(email: userEmail, password: passWord) { (success) in
      if success {
        AuthService.instance.findUserByEmail(completion: { (success) in
          if success {
            NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
            self.spinner.isHidden = true
            self.spinner.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            debugPrint(AuthService.instance.authToken)
          }
        })
      }
    }
  }
  
}
