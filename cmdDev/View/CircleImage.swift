//
//  CircleImage.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

@IBDesignable class CircleImage: UIImageView {

  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setupView()
  }

  func setupView() {
    self.layer.cornerRadius = self.frame.width / 2
    self.clipsToBounds = true
  }
  
}
