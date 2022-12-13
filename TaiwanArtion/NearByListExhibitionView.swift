//
//  NearByListView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/13.
//

import UIKit

enum ListType: Int{
    case baseBottom = 0, slideUp, cellDetailInfo
}


class NearByExhibitionListView: UIView {
    
    var swipeUp: (() -> Void)?
    
    var swipeDown: (() -> Void)?
    
    let blackLine: UIView = {
       let view = UIView()
        view.backgroundColor = .textGrayB0B0B0
        return view
    }()
    
    let showListTitle: UILabel = {
        let label = UILabel()
        label.text = "顯示列表"
        label.textColor = .textBlack636363
        return label
    }()
    
    let items: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 6, height: 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collections = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        collections.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collections.backgroundColor = .white
        return collections
    }()
    
    let exhibationList: UITableView = {
       let tableView = UITableView()
        tableView.register(ExhibitionListTableViewTableViewCell.self, forCellReuseIdentifier: ExhibitionListTableViewTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let swipeUpGesture: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeMoveUp))
        swipe.direction = .up
        swipe.numberOfTouchesRequired = 1
        return swipe
    }()
    
    let swipeDownGesture: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeMoveDown))
        swipe.direction = .down
        swipe.numberOfTouchesRequired = 1
        return swipe
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        blackLine.addGestureRecognizer(swipeUpGesture)
        blackLine.addGestureRecognizer(swipeDownGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func seBottomTypeAutoLayout() {
        addSubview(blackLine)
        addSubview(showListTitle)
        blackLine.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(4)
        }
        
        showListTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(34)
        }
    }
    
    private func setListTypeAutoLayout() {
        addSubview(items)
        addSubview(showListTitle)
        items.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
        }
        showListTitle.snp.makeConstraints { make in
            make.top.equalTo(items.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func swipeMoveUp() {
        swipeUp?()
    }
    
    @objc private func swipeMoveDown() {
        swipeDown?()
    }
}
