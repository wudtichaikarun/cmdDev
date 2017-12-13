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
  var bgColor : UIColor?
  
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.handleTap))
    spinner.isHidden = true
    view.addGestureRecognizer(tap)
  }
  
  // close keyboard
  @objc func handleTap() {
    view.endEditing(true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if UserDataService.instance.imgName != "" {
      self.profileImg.image = UIImage(named: UserDataService.instance.imgName)
      self.imgName = UserDataService.instance.imgName
      if imgName.contains("light") && bgColor == nil {
        self.profileImg.backgroundColor = UIColor.lightGray
      }
    }
  }
  
  @IBAction func btnClose(_ sender: Any) {
    performSegue(withIdentifier: Unwind, sender: nil)
  }
  
  @IBAction func chooseImg(_ sender: Any) {
    performSegue(withIdentifier: ToImagePicker, sender: nil)
  }
  
  // random background image
  @IBAction func btnRandomBgColorClick(_ sender: Any) {
    let r = CGFloat(arc4random_uniform(255)) / 255
    let g = CGFloat(arc4random_uniform(255)) / 255
    let b = CGFloat(arc4random_uniform(255)) / 255
    
    bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    imgColor = "[\(r), \(g), \(b), 1]"
    UIView.animate(withDuration: 0.2) {
      self.profileImg.backgroundColor = self.bgColor
    }
    
  }
  
  // register
  @IBAction func btnRegisterClick(_ sender: Any) {
    spinner.isHidden = false
    spinner.startAnimating()
    
    guard let name = userNameText.text, userNameText.text != "" else { return }
    guard let email = emailText.text, emailText.text != "" else { return }
    guard let password = passwordText.text, passwordText.text != "" else { return }
    
    AuthService.instance.register(email: email, password: password) {
      (success) in
      
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
                  //print(UserDataService.instance.name,UserDataService.instance.imgName)
                  self.spinner.isHidden = true
                  self.spinner.stopAnimating()
                  self.performSegue(withIdentifier: Unwind, sender: nil)
                  NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
                }
              })
           }
        }) // AuthService.instance.login
        
      } // if success
      
    } //AuthService.instance.register
    
  } // btnRegisterClick
  
}
