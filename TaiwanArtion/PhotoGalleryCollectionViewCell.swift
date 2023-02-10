//
//  PhotoGalleryCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/5.
//

import UIKit

class PhotoGalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PhotoGalleryCell"
    
    private let photo: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    private let cornerCounter: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var counterNumber: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
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
        addSubview(photo)
        photo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(cornerCounter)
        cornerCounter.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.width.height.equalTo(24)
        }
        
        addSubview(counterNumber)
        counterNumber.snp.makeConstraints { make in
            make.center.equalTo(cornerCounter)
        }
    }
    
    private func setSelectedCounterString(selected: Bool) -> String {
        if selected {
            counterNumber.isHidden = false
            return "BrownCounter"
        } else {
            counterNumber.isHidden = true
            return "ClearCounter"
        }
    }
    
    func configure(imageName: String, isSelected: Bool, countNumber: Int) {
        photo.image = UIImage(named: imageName)
        cornerCounter.image = UIImage(named: setSelectedCounterString(selected: isSelected))
        counterNumber.text = "\(countNumber)"
    }

}
