//
//  FilterTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/25.
//

import UIKit
import SnapKit
import Reusable

class FilterTableViewCell: UITableViewCell, Reusable {
    //MARK: Properties
    var popOutFilterButton: (() -> Void)?
    
    
    
    //MARK: - UIs
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "近期展覽"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.cornerRadius = button.bounds.size.height / 2.0
        button.clipsToBounds = true
        //            button.layer.borderWidth = 1
        //            button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("一個月", for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(10)
        }
        
        contentView.addSubview(filterButton)
        filterButton.addTarget(self, action: #selector(popup), for: .touchUpInside)
        filterButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(-10)
        }
    }
    
    @objc
    func popup() {
        popOutFilterButton?()
    }
}
