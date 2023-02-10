//
//  ShareExhibitionHeader.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/26.
//

import UIKit

class ShareExhibitionHeaderView: UIView {

    private let shareLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        label.text = "分享展覽讓更多人知道吧！"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let addImageContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .cardBackgroundGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let addImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addImage"), for: .normal)
        return button
    }()
    
    private let addImageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        label.text = "新增圖片"
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
        addSubview(shareLabel)
        shareLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(15)
        }
        
        addSubview(addImageContainerView)
        addImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(shareLabel.snp.bottom).offset(10)
            make.leading.equalTo(shareLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
        
        addSubview(addImageButton)
        addImageButton.snp.makeConstraints { make in
            make.centerX.equalTo(addImageContainerView.snp.centerX)
            make.centerY.equalTo(addImageContainerView.snp.centerY)
        }
        
        addSubview(addImageLabel)
        addImageLabel.snp.makeConstraints { make in
            make.top.equalTo(addImageButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
