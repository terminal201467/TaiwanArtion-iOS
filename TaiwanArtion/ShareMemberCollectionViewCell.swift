//
//  ShareMemberCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/8.
//

import UIKit

class ShareMemberCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ShareMemberCollectionViewCell"
    
    private let memberImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let memberNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
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
        contentView.addSubview(memberImageView)
        memberImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().multipliedBy(10.0/90.0)
            make.leading.equalToSuperview().multipliedBy(10.0/80.0)
            make.trailing.equalToSuperview().multipliedBy(70.0/80.0)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalToSuperview().multipliedBy(2.0/3.0)
        }
        
        contentView.addSubview(appIconImageView)
        appIconImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(10.0/80.0)
            make.bottom.equalToSuperview().multipliedBy(20.0/90.0)
            make.width.equalToSuperview().multipliedBy(30.0/80.0)
            make.height.equalToSuperview().multipliedBy(30.0/90.0)
        }
        
        contentView.addSubview(memberNameLabel)
        memberNameLabel.snp.makeConstraints { make in
            make.top.equalTo(memberImageView.snp.bottom)
            make.centerX.equalTo(memberImageView.snp.centerX)
            make.width.equalTo(memberImageView.snp.width)
            make.height.equalTo(memberImageView.snp.height).multipliedBy(15.0/60.0)
        }
    }
    
    func configureMember(appName: String, memberName: String) {
        memberImageView.image = UIImage(named: memberName)
        appIconImageView.image = UIImage(named: appName)
        memberNameLabel.text = memberName
    }
    
    func configureAirDrop() {
        memberImageView.image = UIImage(named: "AirDrop")
        appIconImageView.isHidden = true
        memberNameLabel.text = "AirDrop"
    }

}
