//
//  whetherStartExhibitionButton.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/14.
//

import UIKit
import SnapKit

class WhetherStartExhibitionButton: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .backgroundColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.cornerRadius = 5
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UIs
    private let whetherStartLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .systemGray4
        label.text = "是否開展"
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down")) //chevron.up
        imageView.tintColor = .systemGray4
        return imageView
    }()
    
    //MARK: - Setup UI
    private func setupUI() {
        addSubview(whetherStartLabel)
        whetherStartLabel.snp.makeConstraints { make in
            make.leading.equalTo(4)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalTo(whetherStartLabel.snp.trailing).offset(2)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}
