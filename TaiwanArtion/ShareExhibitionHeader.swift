//
//  ShareExhibitionHeader.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/26.
//

import UIKit

class ShareExhibitionHeaderView: UIView {
    
    var photos: [String] = ["1","2","3","1","2","3","1","2","3"]

    private let shareLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        label.text = "分享展覽讓更多人知道吧！"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let addImageContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .cardBackgroundGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let addImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addImage"), for: .normal)
        return button
    }()
    
    private let addImageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGrayB0B0B0
        label.text = "新增圖片"
        return label
    }()
    
    private let photosView: DisplayPhotosView = {
       let view = DisplayPhotosView()
        return view
    }()
    
    private let photosCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 52, height: 52)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ChoosedPhotoCollectionViewCell.self, forCellWithReuseIdentifier: ChoosedPhotoCollectionViewCell.identifier)
        collectionView.backgroundColor = nil
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createGradient(view: photosView)
        setPhotoGallery(by: photos)
        setCollectionView()
//        setPageViewAutoLayout()
        setPhotosCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUnPhotosAutoLayout() {
        addSubview(shareLabel)
        shareLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(15)
        }
        
        addSubview(addImageContainerView)
        addImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(shareLabel.snp.bottom).offset(10)
            make.leading.equalTo(shareLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
        
        addSubview(addImageButton)
        addImageButton.snp.makeConstraints { make in
            make.centerX.equalTo(addImageContainerView.snp.centerX)
            make.centerY.equalTo(addImageContainerView.snp.centerY)
        }
        
        addSubview(addImageLabel)
        addImageLabel.snp.makeConstraints { make in
            make.top.equalTo(addImageButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
    
    private func createGradient(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.locations = [0.8, 1]
        gradientLayer.colors = [UIColor.clear.cgColor ,UIColor.white.cgColor]
        view.layer.addSublayer(gradientLayer)
    }
    
    private func setCollectionView() {
        photosCollection.delegate = self
        photosCollection.dataSource = self
    }
    
    private func setPhotosCollection() {
        addSubview(photosCollection)
        photosCollection.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(55)
        }
    }
    
    private func setPageViewAutoLayout() {
        addSubview(shareLabel)
        shareLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(15)
        }
        addSubview(photosView)
        photosView.snp.makeConstraints { make in
            make.top.equalTo(shareLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(-80)
        }
        
    }
    
    private func setPhotoGallery(by photos: [String]) {
        photos.isEmpty ? setUnPhotosAutoLayout() : setPageViewAutoLayout()
    }
    
}

extension ShareExhibitionHeaderView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos.count > 6 {
            return 6
        } else {
            return photos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoosedPhotoCollectionViewCell.identifier, for: indexPath) as! ChoosedPhotoCollectionViewCell
        if indexPath.row == 5{
            cell.displayPhoto.image = UIImage(named: photos[indexPath.row])
            cell.displayPhoto.alpha = 0.8
            cell.displayPhoto.backgroundColor = .textGrayB0B0B0
            cell.setLabelNumber(by: photos.count - 6)
        } else {
            cell.displayPhoto.image = UIImage(named: photos[indexPath.row])
        }
        return cell
    }
    
}
