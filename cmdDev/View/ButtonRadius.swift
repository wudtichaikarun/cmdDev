//
//  ButtonRadius.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

@IBDesignable class ButtonRadius: UIButton {

  @IBInspectable var radiusBotton: CGFloat = 3.0 {
    didSet {
      self.layer.cornerRadius = radiusBotton
    }
  }
  
  override func awakeFromNib() {
    self.setupView()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    self.setupView()
  }
  
  func setupView() {
    self.layer.cornerRadius = radiusBotton
  }

}
