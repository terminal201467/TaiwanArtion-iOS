//
//  NavigateLocationView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/19.
//

import UIKit

class NavigateLocationView: UIView {
    
    var startNavigator: (() -> Void)?

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let locationTitle: UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let buissiniseType: UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Map")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let location: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var locationInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationIcon, location])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 1
        return stackView
    }()
    
    private lazy var infoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationTitle, buissiniseType, locationInfo])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private let distance: UILabel = {
        let label = UILabel()
        label.textColor = .brownColor
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.setTitle("開始導航", for: .normal)
        button.tintColor = .brownColor
        button.configuration = .filled()
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(start), for: .allTouchEvents)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(imageView)
        addSubview(infoStack)
        addSubview(distance)
        addSubview(startButton)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(106)
            make.height.equalTo(87)
        }
        
        infoStack.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.width.equalTo(120)
            make.top.equalTo(imageView.snp.top)
            make.bottom.equalTo(imageView.snp.bottom).offset(-3)
        }
        
        distance.snp.makeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(imageView.snp.leading)
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configure(info: ExhibitionLocationInfo) {
        imageView.image = UIImage(named: info.exhibitionImage)
        locationTitle.text = info.exhibitionTitle
        buissiniseType.text = info.buisinessType ? "營業中" : "已打烊"
        location.text = info.location
        distance.text = info.distance + "Km"
    }
    
    @objc func start() {
        startNavigator?()
    }
}
