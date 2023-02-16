//
//  PlaceChooseViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/16.
//

import UIKit

enum PlaceKind: Int,CaseIterable {
    case nolimited = 0, cultureArea, museum, artGallery, artCultureCenter
    var text: String {
        switch self {
        case .nolimited: return "不限"
        case .cultureArea: return "文創園區"
        case .museum: return "博物館"
        case .artGallery: return "美術館"
        case .artCultureCenter: return "藝文中心"
        }
    }
}

class PlaceChooseViewController: UIViewController {
    
    private let placeChooseCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 80, height: 30)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NorthAreaCell.self, forCellWithReuseIdentifier: NorthAreaCell.identifier)
        return collectionView
    }()
    
    private let correctButton: UIButton = {
       let button = UIButton()
        button.setTitle("確定", for: .normal)
        button.addTarget(self, action: #selector(correct), for: .allEvents)
        button.backgroundColor = .brownColor
        return button
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .backgroundColor
        autoLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setNavigationBar() {
        title = "選擇展覽單位"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .brownColor
    }
    
    private func setCollectionView() {
        placeChooseCollection.dataSource = self
        placeChooseCollection.delegate = self
    }
    
    private func autoLayout() {
        self.view.addSubview(placeChooseCollection)
        self.view.addSubview(correctButton)
        placeChooseCollection.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(80)
        }
        
        correctButton.snp.makeConstraints { make in
            make.top.equalTo(placeChooseCollection.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    @objc private func correct() {
        
    }


}

extension PlaceChooseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlaceKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NorthAreaCell.identifier, for: indexPath) as! NorthAreaCell
        cell.areaLabel.text = PlaceKind(rawValue: indexPath.row)?.text
        return cell
    }
    
    
    
}
