//
//  ShareExhibitionView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/23.
//

import UIKit

class ShareExhibitionView: UIView {
    
    var addAction: (() -> Void)?
    
    var previewActions: ((Bool) -> Void)?
    
    var releaseActions: (() -> Void)?
    
    private var isPreview: Bool = false
    
    let scrollHeader = ShareExhibitionHeaderView()
    
    let scrollFooter = ShareExhibitionFooterView()
    
    let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.bounces = true
        view.isPagingEnabled = false
        view.contentSize = CGSize(width: 0, height: 1200)
        return view
    }()
    
    let table: UITableView = {
        let tableView = UITableView()
        tableView.register(ShareExhibitionTableViewCell.self, forCellReuseIdentifier: ShareExhibitionTableViewCell.identifier)
        tableView.register(ShareExhibitionTextFieldTableViewCell.self, forCellReuseIdentifier: ShareExhibitionTextFieldTableViewCell.identifier)
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
        setHeaderView()
        setFooterView()
        print("scrollViewWidth:\(scrollView.frame.width),scrollViewHeight:\(scrollView.frame.height)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        scrollView.addSubview(scrollHeader)
        scrollHeader.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
        }

        scrollView.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalTo(scrollHeader.snp.bottom)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(scrollHeader.snp.height)
            make.width.equalTo(scrollView.snp.width)
        }

        scrollView.addSubview(scrollFooter)
        scrollFooter.snp.makeConstraints { make in
            make.top.equalTo(table.snp.bottom).offset(50)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(100)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    private func setHeaderView() {
        scrollHeader.addImageButton.addTarget(self, action: #selector(add), for: .touchDown)
    }
    
    private func setFooterView() {
        scrollFooter.previewButton.addTarget(self, action: #selector(previewAction), for: .touchDown)
        scrollFooter.releaseButton.addTarget(self, action: #selector(releaseAction), for: .touchDown)
    }
    
    @objc func add() {
        addAction?()
    }
    
    @objc func previewAction() {
        isPreview.toggle()
        previewActions?(isPreview)
    }
    
    @objc func releaseAction() {
        releaseActions?()
    }
}
