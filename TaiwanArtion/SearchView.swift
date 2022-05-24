//
//  SearchView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit

class SearchView: UIView {
    //MARK: - UIs
    let uiSearchController: UISearchController = {
        let searchController = UISearchController()
        searchController
          .hidesNavigationBarDuringPresentation = true
        searchController
          .obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    let tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TabButtonCollectionViewCell.self, forCellWithReuseIdentifier: TabButtonCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let backView: UIView = {
        let view = UIView()
        return view
    }()
        
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        addSubview(tabCollectionView)
        tabCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(50)
        }
        
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalTo(tabCollectionView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}
