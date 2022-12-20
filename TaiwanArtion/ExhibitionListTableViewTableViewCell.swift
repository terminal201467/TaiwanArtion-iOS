//
//  ExhibitionListTableViewTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/13.
//

import UIKit
import SnapKit

class ExhibitionListTableViewTableViewCell: UITableViewCell {
    
    static let identifier = "ExhibitionListCell"
    
    private let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 3, height: 1)
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    private let exhibitionImage: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let locationTitle: UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        return label
    }()
    
    private let buisinesslight : UIImageView = {
        let image = UIImageView()
         return image
    }()
    
    private let buisinessType:UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        return label
    }()
    
    private let buisinessHour: UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        return label
    }()
    
    private lazy var buisinessInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buisinesslight, buisinessType, buisinessHour])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    let distance: UILabel = {
        let label = UILabel()
        label.textColor = .brownColor
        return label
    }()
    
    let locationIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let locationArea: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        return label
    }()
    
    private lazy var locationInfo: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [locationIcon, locationArea])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func autoLayout() {
        addSubview(containerView)
        addSubview(exhibitionImage)
        addSubview(locationTitle)
        addSubview(buisinessInfo)
        addSubview(locationArea)
        addSubview(locationInfo)
        addSubview(distance)
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        exhibitionImage.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(8)
            make.top.equalTo(containerView.snp.top).offset(3)
            make.bottom.equalTo(containerView.snp.bottom).offset(3)
            make.width.equalTo(150)
        }
        
        locationTitle.snp.makeConstraints { make in
            make.top.equalTo(exhibitionImage.snp.top).offset(8)
            make.leading.equalTo(exhibitionImage.snp.trailing).offset(16)
        }
        
        buisinessInfo.snp.makeConstraints { make in
            make.top.equalTo(locationTitle.snp.bottom).offset(10)
            make.leading.equalTo(locationTitle.snp.leading)
        }
        
        locationInfo.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(-8)
            make.leading.equalTo(buisinessInfo.snp.leading)
        }
        
        distance.snp.makeConstraints { make in
            make.centerY.equalTo(buisinessInfo.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-8)
        }
    }
    
    func configure(info: ExhibitionLocationInfo) {
        exhibitionImage.image = UIImage(named: info.exhibitionImage)
        locationTitle.text = info.exhibitionTitle
        buisinesslight.image = info.buisinessType ? UIImage(named: "營業中") : UIImage(named: "已打烊")
        buisinessType.text = info.buisinessType ? "營業中" : "已打烊"
        buisinessHour.text = info.buisinessTime
        locationIcon.image = UIImage(named: "")
        locationArea.text = info.location
        distance.text = "約\(info.distance)km"
    }

}
