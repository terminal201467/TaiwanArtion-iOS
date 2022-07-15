//
//  AreaTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit
import SnapKit

class PositionTableViewCell: UITableViewCell {
    
    static let identifier = "PositionTableViewCell"
    
    // MARK: - UIs
    let currentMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let currentTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("目前所在位置", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    let unlimitedMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let unlimitedTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("不限區域", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        contentView.backgroundColor = .backgroundColor
        selectionStyle = .none
        
        contentView.addSubview(currentMarkButton)
        currentMarkButton.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.leading.equalTo(16)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        contentView.addSubview(currentTextButton)
        currentTextButton.snp.makeConstraints { make in
            make.centerY.equalTo(currentMarkButton.snp.centerY)
            make.leading.equalTo(currentMarkButton.snp.trailing).offset(8)
        }
        
        contentView.addSubview(unlimitedMarkButton)
        unlimitedMarkButton.snp.makeConstraints { make in
            make.top.equalTo(currentMarkButton.snp.bottom).offset(16)
            make.leading.equalTo(16)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }

        contentView.addSubview(unlimitedTextButton)
        unlimitedTextButton.snp.makeConstraints { make in
            make.centerY.equalTo(unlimitedMarkButton.snp.centerY)
            make.leading.equalTo(unlimitedMarkButton.snp.trailing).offset(8)
        }
    }
}
