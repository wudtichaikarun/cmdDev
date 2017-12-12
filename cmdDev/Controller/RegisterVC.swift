//
//  RegisterVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func btnClose(_ sender: Any) {
    performSegue(withIdentifier: Unwind, sender: nil)
  }
  
}
