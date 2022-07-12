//
//  BlurController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit
import SnapKit

class SeeAllExhibitionViewController: UIViewController {
    
    //MARK: - UIs
    private let tableView = FindExhibitionTableView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    //MARK: - Methods
    
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//
//        }
    }
}
