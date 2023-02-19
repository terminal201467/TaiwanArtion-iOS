//
//  DisplayPhotosView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/15.
//

import UIKit

class DisplayPhotosView: UIView {
    
    var photos: [String] = [] {
        didSet {
            displayPhotos.reloadData()
        }
    }
    
    var currentPhotoPage: Int = 0

    private let displayPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 400, height: 400)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ChoosedPhotoCollectionViewCell.self, forCellWithReuseIdentifier: ChoosedPhotoCollectionViewCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.bounces = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.contentSize = CGSize(width: 400, height: 400)
        return collectionView
    }()
    
    private let barOne: UIView = {
       let view = UIView()
        return view
    }()
    
    private let barTwo: UIView = {
       let view = UIView()
        return view
    }()
    
    private let barThree: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var displayBar: UIStackView = {
       let view = UIStackView(arrangedSubviews: [barOne, barTwo, barThree])
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 3
        return view
    }()
    
    //MARK: -Initailization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionView()
        autoLayout()
        setDisplayBar(by: currentPhotoPage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -UI SetUp
    private func setCollectionView() {
        displayPhotos.delegate = self
        displayPhotos.dataSource = self
    }
    
    private func autoLayout() {
        addSubview(displayPhotos)
        displayPhotos.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(displayBar)
        displayBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(3)
        }
    }
    
    private func setDisplayBar(by position: Int) {
        DispatchQueue.main.async {
            switch position {
            case 0:
                self.barOne.backgroundColor = .brownColor
                self.barTwo.backgroundColor = .textGrayB0B0B0
                self.barThree.backgroundColor = .textGrayB0B0B0
            case 1:
                self.barOne.backgroundColor = .textGrayB0B0B0
                self.barTwo.backgroundColor = .brownColor
                self.barThree.backgroundColor = .textGrayB0B0B0
            case 2:
                self.barOne.backgroundColor = .textGrayB0B0B0
                self.barTwo.backgroundColor = .textGrayB0B0B0
                self.barThree.backgroundColor = .brownColor
            default: print("No Place")
            }
        }
    }
}

extension DisplayPhotosView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoosedPhotoCollectionViewCell.identifier, for: indexPath) as! ChoosedPhotoCollectionViewCell
            cell.displayPhoto.image = UIImage(named: photos[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = displayPhotos.indexPathsForVisibleItems.first {
            setDisplayBar(by: indexPath.row)
        }
    }
}
