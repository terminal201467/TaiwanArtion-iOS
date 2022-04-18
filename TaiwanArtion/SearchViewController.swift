//
//  SearchViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - Properties
    private let searchView = SearchView()
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        
    }
    
    //MARK: - SetupUI
    func setupNavigationItem() {
        navigationItem.title = "SearchTest"
    }
    
    
    
}
