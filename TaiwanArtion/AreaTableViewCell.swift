//
//  AreaTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit

class AreaTableViewCell: UITableViewCell {
    
    static let identifier = "AreaTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
