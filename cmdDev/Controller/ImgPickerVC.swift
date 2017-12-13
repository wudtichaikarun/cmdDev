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
  
  // back to register vc
  @IBAction func btnBackClick(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  // segment selected dark | light
  @IBAction func segmentControlChange(_ sender: Any) {
    if segmentControl.selectedSegmentIndex == 0 {
      imageType = .dark
    } else {
      imageType = .light
    }
    collectionView.reloadData()
  }
  
  // responsive design
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // for iphoneSE
    var numberOfColumns : CGFloat = 3
    // for iphone6 -> iphoneXI
    if UIScreen.main.bounds.width > 320 {
      numberOfColumns = 4
    }
    let speceBetweenCell : CGFloat = 10
    let padding :CGFloat = 40
    let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns - 1 ) * speceBetweenCell) / numberOfColumns
    return CGSize(width: cellDimension, height: cellDimension)
  }
  
  // set image
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if imageType == .dark {
      UserDataService.instance.setProfileImg(imgName: "dark\(indexPath.item)")
    } else {
       UserDataService.instance.setProfileImg(imgName: "light\(indexPath.item)")
    }
    self.dismiss(animated: true, completion: nil)
  }
  
}
