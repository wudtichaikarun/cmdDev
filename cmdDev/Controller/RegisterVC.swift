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
  
  // variable
  var imgName = "profileDefault"
  var imgColor = "[0.5, 0.5, 0.5, 1]"
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func btnClose(_ sender: Any) {
    performSegue(withIdentifier: Unwind, sender: nil)
  }
  
  @IBAction func chooseImg(_ sender: Any) {
    performSegue(withIdentifier: ToImagePicker, sender: nil)
  }
  
  @IBAction func btnRegisterClick(_ sender: Any) {
     guard let name = userNameText.text, userNameText.text != "" else { return }
    guard let email = emailText.text, emailText.text != "" else { return }
    guard let password = passwordText.text, passwordText.text != "" else { return }
    
    AuthService.instance.register(email: email, password: password) { (success) in
      if success {
        // alert
        /*
        let alert = UIAlertController(title: "Alert", message: "register success", preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        */
        
        AuthService.instance.login(email: email, password: password, completion: { (success) in
          if success {
            //print("logged in success", AuthService.instance.authToken)
            AuthService.instance.createUser(
              name: name,
              email: email,
              imgName: self.imgName,
              imgColor: self.imgColor,
              completion: { (success) in
                if success {
                  print(UserDataService.instance.name,UserDataService.instance.imgName)
                  self.performSegue(withIdentifier: Unwind, sender: nil)
                }
            })
          }
          
        })
      }
    }
    
  }
  
}
