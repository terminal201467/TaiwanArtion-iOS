//
//  NearByListView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/13.
//

import UIKit

enum ListViewType: Int {
    case baseBottom = 0, slideUp, detailInfo
}

enum TitleType: Int {
    case anyType = 0, cultureCreationArea, artGallery, museum, exhibitionHall
}

class NearByExhibtionListView: UIView {
    
    var panUp: (() -> Void)?
    
    var panDown: (() -> Void)?
    
    let blackLine: UIView = {
       let view = UIView()
        view.backgroundColor = .textGrayB0B0B0
        return view
    }()
    
    let showListTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "顯示列表"
        return label
    }()

    let exhibitionList: UITableView = {
       let tableView = UITableView()
        tableView.register(ExhibitionListTableViewTableViewCell.self, forCellReuseIdentifier: ExhibitionListTableViewTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let collectionItems: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 6, height: 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    let panUpGesture: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panUpAction(_:)))
        pan.maximumNumberOfTouches = 1
        pan.isEnabled = true
        return pan
    }()
    
    let panDownGesture: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panDownAction(_:)))
        pan.maximumNumberOfTouches = 1
        pan.isEnabled = true
        return pan
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewInBottomAutoLayout()
        addGestureRecognizer(panUpGesture)
        addGestureRecognizer(panDownGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewInBottomAutoLayout() {
        addSubview(blackLine)
        addSubview(showListTitle)
        blackLine.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(40)
            make.top.equalToSuperview().offset(4)
            make.centerX.equalToSuperview()
        }
        
        showListTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(34)
        }
    }
    
    func setItemsAutoLayout() {
        addSubview(collectionItems)
        addSubview(exhibitionList)
        collectionItems.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        exhibitionList.snp.makeConstraints { make in
            make.top.equalTo(collectionItems.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func panUpAction(_ recognizer: UIPanGestureRecognizer) {
        print("panUp")
        panUp?()
    }
    
    @objc func panDownAction(_ recognizer: UIPanGestureRecognizer) {
        print("panDown")
        panDown?()
    }
}
