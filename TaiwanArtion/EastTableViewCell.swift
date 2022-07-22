//
//  EastTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/21.
//

import UIKit
import SnapKit

class EastTableViewCell: UITableViewCell {

    static let identifier = "EastTableViewCell"
    
    // MARK: - UIs
    private let eastAreaButtons = EastAreaButtons()
    
    let eastAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "東部地區"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    let selectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
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
        contentView.addSubview(eastAreaLabel)
        eastAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(16)
        }
        
        contentView.addSubview(selectAllButton)
        selectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(eastAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        contentView.addSubview(eastAreaButtons)
        eastAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(eastAreaLabel.snp.bottom).offset(5)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(-5)
        }
    }
}
