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
      //self.backgroundColor = #colorLiteral(red: 0.9025982022, green: 0.9025982022, blue: 0.9025982022, alpha: 1)
      self.layer.borderWidth = 2.0
      self.layer.borderColor = #colorLiteral(red: 0.3498088419, green: 0.6107168794, blue: 0.780331552, alpha: 1)
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
    //self.backgroundColor = #colorLiteral(red: 0.8974712491, green: 0.8974712491, blue: 0.8974712491, alpha: 1)
    self.layer.borderWidth = 2.0
     self.layer.borderColor = #colorLiteral(red: 0.3498088419, green: 0.6107168794, blue: 0.780331552, alpha: 1)
  }

}

extension UITextView: UITextViewDelegate {
  
  /// Resize the placeholder when the UITextView bounds change
  override open var bounds: CGRect {
    didSet {
      self.resizePlaceholder()
    }
  }
  
  /// The UITextView placeholder text
  public var placeholder: String? {
    get {
      var placeholderText: String?
      
      if let placeholderLabel = self.viewWithTag(100) as? UILabel {
        placeholderText = placeholderLabel.text
      }
      
      return placeholderText
    }
    set {
      if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
        placeholderLabel.text = newValue
        placeholderLabel.sizeToFit()
      } else {
        self.addPlaceholder(newValue!)
      }
    }
  }
  
  /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
  ///
  /// - Parameter textView: The UITextView that got updated
  public func textViewDidChange(_ textView: UITextView) {
    if let placeholderLabel = self.viewWithTag(100) as? UILabel {
      placeholderLabel.isHidden = self.text.characters.count > 0
    }
  }
  
  /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
  private func resizePlaceholder() {
    if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
      let labelX = self.textContainer.lineFragmentPadding
      let labelY = self.textContainerInset.top - 2
      let labelWidth = self.frame.width - (labelX * 2)
      let labelHeight = placeholderLabel.frame.height
      
      placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
    }
  }
  
  /// Adds a placeholder UILabel to this UITextView
  private func addPlaceholder(_ placeholderText: String) {
    let placeholderLabel = UILabel()
    
    placeholderLabel.text = placeholderText
    placeholderLabel.sizeToFit()
    
    placeholderLabel.font = self.font
    placeholderLabel.textColor = #colorLiteral(red: 0.8432195783, green: 0.8429442048, blue: 0.8559620976, alpha: 1)
    placeholderLabel.tag = 100
    
    placeholderLabel.isHidden = self.text.characters.count > 0
    
    self.addSubview(placeholderLabel)
    self.resizePlaceholder()
    self.delegate = self
  }
  
}
