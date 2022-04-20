//
//  MainView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit
import Reusable

class FindExhibitionView: UIView {
    //MARK: UIs
    let findExhibitionTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FindExhibitionHeader.self, forHeaderFooterViewReuseIdentifier: FindExhibitionHeader.identifier)
        tableView.register(cellType: FindExhibitionTableViewCell.self)
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
    private func setupUI() {
        addSubview(findExhibitionTableView)
        findExhibitionTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalTo(0)
        }
    }
}
