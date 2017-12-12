//
//  GradientView.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit
@IBDesignable class GradientView: UIView {
  
  @IBInspectable var topGradient: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
    didSet {
      self.setNeedsLayout()
    }
  }
  
  @IBInspectable var bottomGradient: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
    didSet {
      self.setNeedsLayout()
    }
  }
  
  override func layoutSubviews() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [topGradient.cgColor, bottomGradient.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientLayer.frame = self.bounds
    self.layer.insertSublayer(gradientLayer, at: 0)
  }

}
