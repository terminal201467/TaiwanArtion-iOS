//
//  SearchBarCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/13.
//

import UIKit

class SearchBarCell: UITableViewCell {
    
    static let identifier = "SearchBarCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
