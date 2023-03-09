//
//  ShareItemTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/8.
//

import UIKit

class ShareItemsTableViewCell: UITableViewCell {
    
    static let idnetifier: String = "ShareItemsTableViewCell"
    
    var shareMembers:[String] = []

    private let shareMemberCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ShareAppCollectionViewCell.self, forCellWithReuseIdentifier: ShareAppCollectionViewCell.identifier)
        collectionView.register(ShareMemberCollectionViewCell.self, forCellWithReuseIdentifier: ShareMemberCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        shareMemberCollectionView.dataSource = self
        shareMemberCollectionView.delegate = self
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

extension ShareItemsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + shareMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShareAppCollectionViewCell.identifier, for: indexPath) as! ShareAppCollectionViewCell
            cell.configure(appName: "AirDrop")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShareMemberCollectionViewCell.identifier, for: indexPath) as! ShareMemberCollectionViewCell
            cell.configureMember(appName: shareMembers[indexPath.row], memberName: shareMembers[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt:\(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 90)
    }
    
}

