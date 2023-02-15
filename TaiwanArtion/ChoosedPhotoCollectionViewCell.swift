//
//  ChoosedPhotoCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/15.
//

import UIKit

class ChoosedPhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChoosePhotoCell"
    
    let displayPhoto: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.isHidden = true
        label.font = .systemFont(ofSize: 18)
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
        addSubview(displayPhoto)
        displayPhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    public func setLabelNumber(by number: Int) {
        label.isHidden = false
        label.text = "+\(number)"
    }
}
