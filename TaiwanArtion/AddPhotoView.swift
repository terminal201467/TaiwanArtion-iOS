//
//  AddPhotoView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import UIKit

class AddPhotoView: UIView {

    let photoGallery: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.register(PhotoGalleryCollectionViewCell.self, forCellWithReuseIdentifier: PhotoGalleryCollectionViewCell.identifier)
        view.showsVerticalScrollIndicator = false
        view.allowsSelection = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(photoGallery)
        photoGallery.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
}
