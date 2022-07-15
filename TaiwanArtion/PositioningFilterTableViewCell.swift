//
//  PositioningFilterTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/15.
//

import UIKit

class PositioningFilterTableViewCell: UITableViewCell {

    static let identifier = "PositioningFilterTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        
    }
}
