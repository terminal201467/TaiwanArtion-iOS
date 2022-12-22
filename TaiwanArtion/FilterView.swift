//
//  FilterView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import UIKit

class FilterView: UIView {

    private let areaView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .backgroundColor
        view.register(NorthAreaCell.self, forCellWithReuseIdentifier: NorthAreaCell.identifier)
        view.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        view.register(SectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionFooter.identifier)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(areaView)
       areaView.snp.makeConstraints { make in
           make.edges.equalToSuperview()
        }
    }
    
}

class SectionHeader: UICollectionReusableView {
    
    static let identifier: String = "Header"
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Map")
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let currentLoactionText: UILabel = {
        let label = UILabel()
        label.textColor = .brownColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "目前所在位置"
        return label
    }()
    
    private lazy var currentLoactions: UIStackView = {
       let view = UIStackView(arrangedSubviews: [locationIcon, currentLoactionText])
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 2
        view.axis = .horizontal
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        currentLoactions.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

class SectionFooter: UICollectionReusableView {
    
    static let identifier: String = "Footer"
    
    var correctActions: (() -> Void)?
    
    private let correctButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.setTitle("確定", for: .normal)
        button.addTarget(self, action: #selector(correctAction), for: .touchDown)
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
        addSubview(correctButton)
        correctButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    @objc func correctAction() {
        correctActions?()
    }
}
