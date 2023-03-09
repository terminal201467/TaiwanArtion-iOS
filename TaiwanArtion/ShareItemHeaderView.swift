//
//  ShareItemHeaderView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/6.
//

import UIKit

class ShareItemHeaderView: UITableViewCell {
    
    var closeAction: (()->(Void))?
    
    static let identifier: String = "ShareItemHeaderView"
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TaiwanArtionFullLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchDown)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        contentView.addSubview(titleImage)
        titleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.width.equalTo(30)
        }
    }
    
    @objc private func close() {
        closeAction?()
    }
    
}
