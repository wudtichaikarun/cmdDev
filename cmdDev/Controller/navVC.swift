//
//  navVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class navVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var btnLogin: UIButton!
  @IBOutlet weak var tableView: UITableView!
  @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
  @IBOutlet weak var userImage: CircleImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    NotificationCenter.default.addObserver(self, selector: #selector(navVC.userDataChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
    
    SocketService.instance.getCategory { (success) in
      if success {
        self.tableView.reloadData()
      }
    }
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    setUpUserInfo()
  }
  
  @objc func userDataChange(_ notif: Notification) {
    setUpUserInfo()
  }

  @IBAction func btnAddCategoryClick(_ sender: Any) {
    let addCategory = AddCategoryVC()
    addCategory.modalPresentationStyle = .custom
    present(addCategory, animated: true, completion: nil)
  }
  
  @IBAction func btnLoginClick(_ sender: Any) {
    if AuthService.instance.isLogggedIn {
      let profile = ProfileVC()
      profile.modalPresentationStyle = .custom
      present(profile, animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: ToLogin, sender: nil)
    }

  }
  
  func setUpUserInfo() {
    if AuthService.instance.isLogggedIn {
      btnLogin.setTitle(UserDataService.instance.name, for: .normal)
      userImage.image = UIImage(named: UserDataService.instance.imgName)
      userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.imgColor)
    } else {
      btnLogin.setTitle("Login", for: .normal)
      userImage.image = UIImage(named: "menuProfileIcon")
      userImage.backgroundColor = UIColor.clear
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell{
      let category = DataService.instance.categorys[indexPath.row]
      cell.configCell(category: category)
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataService.instance.categorys.count
  }
  
  
}
