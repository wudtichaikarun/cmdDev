//
//  ImgPickerVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class ImgPickerVC: UIViewController, UICollectionViewDelegate,
 UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  // outlets
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  
  // variables
  var imageType = imgType.dark
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath) as? ImgCell {
      cell.configCell(index: indexPath.item, type: imageType )
      return cell
    }
    return ImgCell()
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 28
  }
  
  @IBAction func btnBackClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func segmentControlChange(_ sender: Any) {
  }
  
}
