//
//  ShareAppCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/8.
//

import UIKit

class ShareAppCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ShareAppCollectionViewCell"
    
    private let appNameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let appLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var appInfo: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [appNameImageView, appLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
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
        contentView.addSubview(appNameImageView)
        appNameImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(60.0/90.0)
            make.width.equalToSuperview().multipliedBy(60.0/80.0)
        }
        contentView.addSubview(appLabel)
        appLabel.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(15.0/90.0)
        }
        contentView.addSubview(appInfo)
        appInfo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(appName: String) {
        appNameImageView.image = UIImage(named: appName)
        appLabel.text = appName
    }

}
