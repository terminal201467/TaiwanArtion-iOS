//
//  Find FindExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit

class FindExhibitionViewController: UIViewController {
    //MARK: Properties
    private let mainView = FindExhibitionView()
    
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }
    
    //MARK: - SetupNavigationItem
    func setupNavigationItem() {
        title = "findTest"
        //leftBarButtonItem
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(leftButton))
        self.navigationItem.leftBarButtonItem = leftButton
        
        //rightBarButtonItem
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(rightButton))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func leftButton(_ sender: UIBarButtonItem) {
        print("leftButton")
    }
    
    @objc func rightButton(_ sender: UIBarButtonItem) {
        print("rightButton")
    }
    

}
