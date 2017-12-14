//
//  TextFildCustom.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

@IBDesignable class TextFildCustom: UITextView {
  

  @IBInspectable var radius: CGFloat = 3.0 {
    didSet {
      self.layer.cornerRadius = radius
      self.backgroundColor = #colorLiteral(red: 0.9025982022, green: 0.9025982022, blue: 0.9025982022, alpha: 1)
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
    self.layer.cornerRadius = radius
    self.backgroundColor = #colorLiteral(red: 0.8974712491, green: 0.8974712491, blue: 0.8974712491, alpha: 1)
  }

}
