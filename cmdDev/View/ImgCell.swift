//
//  ImgCell.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class ImgCell: UICollectionViewCell {
  
  @IBOutlet weak var imageFromView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setUpView()
    
  }
  
  func setUpView () {
    self.layer.backgroundColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
  }
  
}
