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
    
    let testList: [Int] = [1, 2, 3, 4, 5, 6]
    
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return testList.count
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ScrollPhotoTableViewCell.self)
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FilterTableViewCell.self)
            cell.selectionStyle = .none
            cell.popOutFilterButton = { [unowned self] in
                let blurVC = BlurController()
                blurVC.modalPresentationStyle = .custom
                self.present(blurVC, animated: true, completion: nil)
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FindExhibitionTableViewCell.self)
            let image = UIImage(named: "3")
            cell.recentExhibitionImageView.image = image!
            return cell
        }
    }
}

//MARK: - TableViewDelegate
extension FindExhibitionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 600
        } else if indexPath.section == 1 {
            return 50
        } else {
            return 370
        }
    }
}
