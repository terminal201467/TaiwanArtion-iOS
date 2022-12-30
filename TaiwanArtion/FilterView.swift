//
//  FilterView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import UIKit

class FilterView: UIView {
    
    let scrollContainer: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.bounces = true
        view.isPagingEnabled = false
        view.isScrollEnabled = true
        view.contentSize = CGSize(width: 0, height: 800)
        return view
    }()
    
    let container: UIView = {
       let view = UIView()
        return view
    }()
    
    var backLocationAction: (() -> Void)?
    
    private let locationIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(backLocation), for: .touchDown)
        return button
    }()
    
    private let currentLoactionText: UIButton = {
        let button = UIButton()
        button.setTitle("目前所在位置", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()

    let areaView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.isScrollEnabled = false
        view.backgroundColor = .backgroundColor
        view.register(NorthAreaCell.self, forCellWithReuseIdentifier: NorthAreaCell.identifier)
        view.register(SectionTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionTitle.identifier)
        return view
    }()
    
    var correctActions: (() -> Void)?
    
    private let correctButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.setTitle("確定", for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(correctAction), for: .touchDown)
        return button
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
        addSubview(scrollContainer)
        scrollContainer.addSubview(container)
        container.addSubview(areaView)
        scrollContainer.addSubview(locationIcon)
        scrollContainer.addSubview(currentLoactionText)
        scrollContainer.addSubview(correctButton)
        
        scrollContainer.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        locationIcon.snp.makeConstraints { make in
            make.top.equalTo(scrollContainer.snp.top).offset(20)
            make.leading.equalTo(scrollContainer.snp.leading).offset(20)
            make.width.height.equalTo(44)
        }

        currentLoactionText.snp.makeConstraints { make in
            make.leading.equalTo(locationIcon.snp.trailing).offset(10)
            make.centerY.equalTo(locationIcon.snp.centerY)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalTo(locationIcon.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(safeAreaLayoutGuide.snp.height)
        }

        areaView.snp.makeConstraints { make in
            make.edges.equalTo(container.snp.edges)
        }
        
        correctButton.snp.makeConstraints { make in
            make.top.equalTo(container.snp.bottom)
            make.leading.equalTo(container.snp.leading).offset(10)
            make.trailing.equalTo(container.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    @objc func correctAction() {
        correctActions?()
    }
    
    @objc func backLocation() {
        backLocationAction?()
    }
    
}

class SectionTitle: UICollectionReusableView {
    
    static let identifier: String = "SectionTitle"
    
    var selectAll: (() -> Void)?
    
    let areaLabel:UILabel = {
        let label = UILabel()
        label.textColor = .textBlack636363
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let selectAllButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.brownColor, for: .normal)
        button.setTitle("全選", for: .normal)
        button.addTarget(self, action: #selector(selectAllActioin), for: .touchDown)
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
        addSubview(areaLabel)
        addSubview(selectAllButton)
        areaLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        selectAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    @objc func selectAllActioin() {
        selectAll?()
    }
    
}
