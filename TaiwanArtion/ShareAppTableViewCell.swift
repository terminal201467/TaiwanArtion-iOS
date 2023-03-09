//
//  ShareAppTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/7.
//

import UIKit

enum ShareApps: Int, CaseIterable {
    case line = 0, facebook, instagram, message
    var appName: String {
        switch self {
        case .line: return "Line"
        case .facebook: return "Facebook"
        case .instagram: return "Instagram"
        case .message: return "Message"
        }
    }
}

class ShareAppTableViewCell: UITableViewCell {
    
    static let identifier: String = "ShareAppTableViewCell"
    
    private let shareMemberCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ShareAppCollectionViewCell.self, forCellWithReuseIdentifier: ShareAppCollectionViewCell.identifier)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollectionView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        shareMemberCollectionView.delegate = self
        shareMemberCollectionView.dataSource = self
    }
    
    private func autoLayout() {
        contentView.addSubview(shareMemberCollectionView)
        shareMemberCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension ShareAppTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ShareApps.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShareAppCollectionViewCell.identifier, for: indexPath) as! ShareAppCollectionViewCell
        cell.configure(appName: ShareApps.allCases[indexPath.row].appName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 90)
    }
}
