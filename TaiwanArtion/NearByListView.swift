//
//  NearByListView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/13.
//

import UIKit

class NearByListView: UIView {

    let exhibationList: UITableView = {
       let tableView = UITableView()
        tableView.register(ExhibitionListTableViewTableViewCell.self, forCellReuseIdentifier: ExhibitionListTableViewTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
