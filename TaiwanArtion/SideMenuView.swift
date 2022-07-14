//
//  SideMenuView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit
import Reusable

class SideMenuView: UIView {
    //MARK: UIs
    let sideMenuTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideMenuCell")
        tableView.isScrollEnabled = false
        return tableView
    }()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        addSubview(sideMenuTableView)
        sideMenuTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
