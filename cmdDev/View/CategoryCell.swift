//
//  CategoryCell.swift
//  cmdDev
//
//  Created by Romantic on 14/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

  @IBOutlet weak var categoryName: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    if selected {
      self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
    } else {
      self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
  }
  
  func configCell ( category: Category) {
    let  title = category.categoryName ?? ""
    categoryName.text = title
  }

}
