//
//  navVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class navVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
  }

}
