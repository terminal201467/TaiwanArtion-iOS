//
//  TotalExhibitionCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/29.
//

import UIKit
import SnapKit

class TotalExhibitionCell: UITableViewCell {

    static let identifier = "TotalExhibitionCell"
    
    // MARK: - UIs
    private let totalExhibitionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "共 500 件展覽"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        selectionStyle = .none
        isUserInteractionEnabled = false
        
        contentView.addSubview(totalExhibitionLabel)
        totalExhibitionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(16)
        }
    }
}
