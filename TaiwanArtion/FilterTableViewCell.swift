//
//  FilterTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/25.
//

import UIKit
import SnapKit

protocol TableViewCellDelegate: AnyObject {
    func didButtonPressed()
}

class FilterTableViewCell: UITableViewCell {
    
    static let identifier = "FilterTableViewCell"

    //MARK: Properties
    weak var buttonDelegate: TableViewCellDelegate?
    
    //MARK: - UIs
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "近期展覽"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .backgroundColor
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
            make.leading.equalTo(16)
        }
        
        contentView.addSubview(filterButton)
        filterButton.addTarget(self, action: #selector(popup), for: .touchUpInside)
        filterButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
    }
    
    @objc
    func popup() {
        buttonDelegate?.didButtonPressed()
    }
}
