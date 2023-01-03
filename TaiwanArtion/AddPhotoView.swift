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
        flowLayout.itemSize = CGSize(width: 114, height: 103)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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
            make.edges.equalToSuperview()
        }
    }
    
}
