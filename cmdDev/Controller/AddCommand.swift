//
//  AddCommand.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class AddCommand: UIViewController {
  @IBOutlet weak var cmdNameText: UITextField!
  @IBOutlet weak var cmdDescriptionText: UITextView!
  @IBOutlet weak var bgView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
  }
  
  func setUpView() {
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddCommand.closeTap(_:)))
    bgView.addGestureRecognizer(closeTouch)
    
  }
  
  @objc func closeTap (_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func btnCloseModalClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  

  @IBAction func btnCreateCommandClick(_ sender: Any) {
    if AuthService.instance.isLogggedIn {
      guard let categoryId = DataService.instance.selectedCategory?.categoryId else { return }
      guard let cmdKey = cmdNameText.text else { return }
      guard let cmdDescription = cmdDescriptionText.text else { return }
      
      SocketService.instance.addCommand(cmdKey: cmdKey, cmdDescription: cmdDescription, categoryId: categoryId, completion: { (success) in
        if success {
          self.cmdNameText.text = ""
          self.cmdNameText.resignFirstResponder()
          self.cmdDescriptionText.text = ""
          self.cmdDescriptionText.resignFirstResponder()
          
          self.dismiss(animated: true, completion: nil)
          
        }
      })
    }
  }
  
}
