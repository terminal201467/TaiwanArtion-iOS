//
//  OuterIslandTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/21.
//

import UIKit
import SnapKit

class OuterIslandTableViewCell: UITableViewCell {

    static let identifier = "OuterIslandTableViewCell"
    
    // MARK: - UIs
    private let outerIslandAreaButtons = OuterIslandAreaButtons()
    
    private let outerIslandAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "離島地區"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let selectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("確定", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .brownColor
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
        contentView.addSubview(outerIslandAreaLabel)
        outerIslandAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(16)
        }
        
        contentView.addSubview(selectAllButton)
        selectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(outerIslandAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        contentView.addSubview(outerIslandAreaButtons)
        outerIslandAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(outerIslandAreaLabel.snp.bottom).offset(5)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(93)
        }
        
        contentView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(outerIslandAreaButtons.snp.bottom).offset(29)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(40)
        }
    }
}
