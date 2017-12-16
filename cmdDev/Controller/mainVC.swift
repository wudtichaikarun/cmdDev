//
//  mainVC.swift
//  cmdDev
//
//  Created by Romantic on 13/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import UIKit

class mainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var btnMenu: UIButton!
  @IBOutlet weak var categoryNameLbl: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityView: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    if AuthService.instance.isLogggedIn {
      activityView.isHidden = false
      activityView.startAnimating()
    }
    
    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableViewAutomaticDimension
    
    btnMenu.addTarget(
      self.revealViewController(),
      action: #selector(SWRevealViewController.revealToggle(_:)),
      for: .touchUpInside
    )
    
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
    NotificationCenter.default.addObserver(self, selector: #selector(mainVC.userDataChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(mainVC.categorySelected(_:)), name: NOTIF_CATEGORY_SELECTED, object: nil)
    
    SocketService.instance.getCommandMassage { (success) in
      if success {
        self.tableView.reloadData()
        if DataService.instance.categorys.count > 0 {
          let endIndex = IndexPath(row: DataService.instance.commands.count - 1, section: 0)
          self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
        }
      }
    }
    
    if AuthService.instance.isLogggedIn {
      AuthService.instance.findUserByEmail(completion: { (success) in
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
      })
    }
    
  }
  
  @objc func userDataChange (_ notif: Notification) {
    if AuthService.instance.isLogggedIn {
      // get category
      onLoginGetMessage()
    } else {
      categoryNameLbl.text = "Please Log In"
    }
  }
  
  @objc func categorySelected (_ notif: Notification) {
    updateWithCategory()
  }
  
  
  @IBAction func btnCreateCmdClick(_ sender: Any) {
    if AuthService.instance.isLogggedIn {
      let addCommand = AddCommand()
      addCommand.modalPresentationStyle = .custom
      present(addCommand, animated: true, completion: nil)
    }
  }
  
  
  func updateWithCategory () {
    let categoryName = DataService.instance.selectedCategory?.categoryName ?? ""
    categoryNameLbl.text = "#\(categoryName)"
    getCommands()
  }
  
  func onLoginGetMessage () {
    DataService.instance.findAllCategory { (success) in
      if success {
        if DataService.instance.categorys.count > 0 {
          DataService.instance.selectedCategory = DataService.instance.categorys[0]
          self.updateWithCategory()
        } else {
          self.categoryNameLbl.text = "No category!"
        }
      }
    }
  }
  
  func getCommands () {
    guard let catId = DataService.instance.selectedCategory?.categoryId else { return }
    DataService.instance.findAllCommandForMain(categoryId: catId) { (success) in
      if success {
        self.tableView.reloadData()
        self.activityView.isHidden = true
        self.activityView.stopAnimating()
      }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "commandCell", for: indexPath) as? CommandCell {
      let command = DataService.instance.commands[indexPath.row]
      cell.configureCell(command: command)
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataService.instance.commands.count
  }
  
}
