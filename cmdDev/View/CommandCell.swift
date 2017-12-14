//
//  CommandCell.swift
//  cmdDev
//
//  Created by Romantic on 15/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class CommandCell: UITableViewCell {

  @IBOutlet weak var cmdKeyLbl: UILabel!
  @IBOutlet weak var cmdDescriptionLbl: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  func configureCell (command: Command) {
    cmdKeyLbl.text = command.cmdKey
    cmdDescriptionLbl.text = command.cmdDescription
  }

}
