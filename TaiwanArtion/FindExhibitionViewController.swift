//
//  Find FindExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SideMenu

class FindExhibitionViewController: UIViewController {
    //MARK: Properties
    private let findExhibitionView = FindExhibitionView()
    private let sideMenu = UISideMenuNavigationController(rootViewController: SideMenuController())
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = findExhibitionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        setupNavigationItem()
        setupTableViewDelegate()
    }
    
    //MARK: - SetupSideMenu
    func setupSideMenu() {
        sideMenu.leftSide = true
        sideMenu.menuWidth = 150
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
    }
    
    //MARK: setupTableViewDelegate
    func setupTableViewDelegate() {
        findExhibitionView.findExhibitionTableView .dataSource = self
        findExhibitionView.findExhibitionTableView.delegate = self
    }

    
    //MARK: - SetupNavigationItem
    func setupNavigationItem() {
        navigationItem.title = "FindTest"
        //leftBarButtonItem
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(leftButton))
        self.navigationItem.leftBarButtonItem = leftButton
        
        //rightBarButtonItem
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(rightButton))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    //MARK: - Methods
    @objc func leftButton(_ sender: UIBarButtonItem) {
        present(sideMenu, animated: true, completion: nil)
    }
    
    @objc func rightButton(_ sender: UIBarButtonItem) {
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}

//MARK: - TableViewDataSource
extension FindExhibitionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FindExhibitionTableViewCell.self)
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FindExhibitionHeader.identifier)
        header?.backgroundColor = .orange
        return header
    }
}

//MARK: - TableViewDelegate
extension FindExhibitionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        500
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

