//
//  ItemsCollectionCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/16.
//

import UIKit

class ItemsCollectionCell: UICollectionViewCell {
    
    static let identifier: String = "Cell"
    
    let label:UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
