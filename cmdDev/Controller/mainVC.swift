//
//  mainVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class mainVC: UIViewController {

  @IBOutlet weak var btnMenu: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(
      self.revealViewController(),
      action: #selector(SWRevealViewController.revealToggle(_:)),
      for: .touchUpInside
    )
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
  }
}
