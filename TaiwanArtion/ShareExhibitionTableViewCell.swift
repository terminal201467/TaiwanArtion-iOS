//
//  ShareExhibitionTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/28.
//

import UIKit

class ShareExhibitionTableViewCell: UITableViewCell {
    
    static let identifier: String = "ShareExhibitionCell"
    
    var choosed: (() -> (Void))?
    
    private let grayAreaView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .cardBackgroundGray
        return view
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.textColor = .whetherStartBorderGray
        return label
    }()
    
    let downButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "chevron.down"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(choose), for: .touchDown)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func choose() {
        choosed?()
    }
    
    private func autoLayout() {
        contentView.addSubview(grayAreaView)
        grayAreaView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.equalTo(grayAreaView.snp.leading).offset(10)
            make.trailing.equalTo(grayAreaView.snp.trailing)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(downButton)
        downButton.snp.makeConstraints { make in
            make.trailing.equalTo(grayAreaView.snp.trailing).offset(-10)
            make.centerY.equalToSuperview()
        }
    }
}
