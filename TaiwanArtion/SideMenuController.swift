//
//  SideMenuViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SideMenu

class SideMenuController: UIViewController {
    //MARK: - Properties
    let sideMenuView = SideMenuView()
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = sideMenuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegate()
        sideMenuView.sideMenuTableView.reloadData()
    }
    
    //MARK: setupTableViewDelegate
    func setupTableViewDelegate() {
        sideMenuView.sideMenuTableView.dataSource = self
        sideMenuView.sideMenuTableView.delegate = self
    }
}

//MARK: - TableViewDataSource
extension SideMenuController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.textLabel?.text = "Button \(indexPath.row + 1)"
        
        return cell
    }
}

//MARK: - TableViewDelegate
extension SideMenuController: UITableViewDelegate {
    
}
