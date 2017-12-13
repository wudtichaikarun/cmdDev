//
//  ImgCell.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

enum imgType {
  case dark
  case light
}

class ImgCell: UICollectionViewCell {
  
  @IBOutlet weak var imageFromView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setUpView()
    
  }
  
  func configCell (index: Int, type: imgType) {
    if type == imgType.dark {
      imageFromView.image = UIImage(named: "dark\(index)")
      self.layer.backgroundColor = UIColor.lightGray.cgColor
    } else {
      imageFromView.image = UIImage(named: "light\(index)")
      self.layer.backgroundColor = UIColor.gray.cgColor
    }
  }
  
  func setUpView () {
    self.layer.backgroundColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
  }
  
}
