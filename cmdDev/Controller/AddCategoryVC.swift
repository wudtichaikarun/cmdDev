//
//  AddCategoryVC.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class AddCategoryVC: UIViewController {

  @IBOutlet weak var catNameText: UITextField!
  @IBOutlet weak var bgView: UIView!
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setUpView()
    }
  
  @IBAction func btnCloseModalClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func btnCreateCategoryClick(_ sender: Any) {
  }
  
  func setUpView() {
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddCategoryVC.closeTap(_:)))
    bgView.addGestureRecognizer(closeTouch)
    
  }
  
  @objc func closeTap (_ recognizer: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  
}
