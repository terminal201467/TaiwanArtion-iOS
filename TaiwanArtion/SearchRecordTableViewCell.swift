//
//  ExhibitionSearchRecordTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/8/5.
//

import UIKit
import SnapKit

class SearchRecordTableViewCell: UITableViewCell {

    static let identifier = "SearchRecordTableViewCell"

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
