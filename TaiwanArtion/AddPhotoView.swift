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
        
        let view = UICollectionView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        
    }
    
}
