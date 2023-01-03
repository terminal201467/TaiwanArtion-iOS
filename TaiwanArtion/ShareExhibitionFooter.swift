//
//  ShareExhibitionFooter.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/26.
//

import UIKit

class ShareExhibitionFooterView: UIView {

    let previewButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brownColor.cgColor
        button.layer.cornerRadius = 5
        button.setTitle("預覽", for: .normal)
        button.setTitleColor(.brownColor, for: .normal)
        return button
    }()
    
    let releaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.layer.cornerRadius = 5
        button.setTitle("發布", for: .normal)
        return button
    }()
    
    private lazy var buttons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [previewButton, releaseButton])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 1
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(buttons)
        buttons.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
        }
    }
}
