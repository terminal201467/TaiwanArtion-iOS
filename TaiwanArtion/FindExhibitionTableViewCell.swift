//
//  FindExhibitionTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/20.
//

import UIKit
import SnapKit
import Reusable

class FindExhibitionTableViewCell: UITableViewCell, Reusable {
    
    static let identifier = "FindExhibitionTableViewCell"
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
