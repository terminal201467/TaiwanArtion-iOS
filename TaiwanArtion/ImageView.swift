//
//  ImageView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/20.
//

import UIKit
import SnapKit

class ImageView: UIView {
    //MARK: - UIs
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            
        }
    }
}
