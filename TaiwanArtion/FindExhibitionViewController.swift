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
    private let mainView = FindExhibitionView()
    private let sideMenu = UISideMenuNavigationController(rootViewController: SideMenuController())
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        setupNavigationItem()
    }
    
    //MARK: - SetupSideMenu
    func setupSideMenu() {
        sideMenu.leftSide = true
        sideMenu.menuWidth = 150
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
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
