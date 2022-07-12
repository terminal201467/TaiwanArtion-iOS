//
//  Find FindExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit
import SideMenu

class FindExhibitionViewController: UIViewController {
    
    //MARK: Properties
    private let tableView = FindExhibitionTableView()
    private let sideMenu = UISideMenuNavigationController(rootViewController: SideMenuController())
    
//    let testList: [Int] = [1, 2, 3, 4, 5, 6]

           
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSideMenu()
        setupNavigation()
        tableView.buttonDelegate = self
    }
    
    //MARK: - Set SideMenu
    private func setupSideMenu() {
        sideMenu.leftSide = true
        sideMenu.menuWidth = 150
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
    }
    
    //MARK: - Set NavigationItem
    private func setupNavigation() {
        navigationItem.title = "FindTest"
        //leftBarButtonItem
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(leftButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButton
        
        //rightBarButtonItem
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(rightButton))
        rightButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Methods
    @objc
    func leftButton(_ sender: UIBarButtonItem) {
        present(sideMenu, animated: true, completion: nil)
    }
    
    @objc
    func rightButton(_ sender: UIBarButtonItem) {
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}

extension FindExhibitionViewController: TableViewCellDelegate {
    func didButtonPressed() {
        let vc = SeeAllExhibitionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
        
//    func didButtonPressed() {
//        let vc = SeeAllExhibitionViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
