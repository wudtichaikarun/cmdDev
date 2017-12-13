//
//  ModalRadius.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

@IBDesignable class ModalRadius: UIView {

  @IBInspectable var radius: CGFloat = 8.0 {
    didSet {
      self.layer.cornerRadius = radius
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.setUpView()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    self.setUpView()
  }
  
  func setUpView() {
    self.layer.cornerRadius = radius
  }

}
