//
//  AreaViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/5/19.
//

import UIKit
import SnapKit

class AreaViewController: UIViewController {
    
    //MARK: - UIs
    
    let tableView = AreaTableView()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        view.tag = 0
        view.backgroundColor = .backgroundColor
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    

}
