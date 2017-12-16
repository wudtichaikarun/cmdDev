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
    // call close modal func
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddCommand.closeTap(_:)))
    bgView.addGestureRecognizer(closeTouch)
    
    // call close keyboard func
     let tap = UITapGestureRecognizer(target: self, action: #selector(AddCommand.handleTap))
    view.addGestureRecognizer(tap)
    
    // add place holder to textView
    cmdDescriptionText.placeholder = "Description"
  }
  
  // close keyboard func
  @objc func handleTap() {
    view.endEditing(true)
  }
  
  // close modal func
  @objc func closeTap (_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  
  // cloe modal by btn
  @IBAction func btnCloseModalClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  // btn create command
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
