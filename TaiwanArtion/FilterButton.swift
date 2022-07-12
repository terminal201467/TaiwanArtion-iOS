//
//  FilterButton.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/12.
//

import UIKit

class FilterButton: UICollectionView {
    
    let filterDate:[String] = ["不限", "一週", "一個月", "三個月"]
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .backgroundColor
        register(FilterButtonCell.self, forCellWithReuseIdentifier: FilterButtonCell.identifier)
        isScrollEnabled = false
        dataSource = self
        delegate = self
        self.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

//MARK: - Data Source
extension FilterButton: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonCell.identifier, for: indexPath) as! FilterButtonCell
        cell.rangeLabel.text = filterDate[indexPath.row]
        return cell
    }
}

//MARK: - Delegate
extension FilterButton: UICollectionViewDelegate {
    
}

//MARK: - CollectionViewDelegateFlowLayout
extension FilterButton: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // (collectionView.邊界.寬 - 間距大小 * cell有幾幾個間距) / 想要幾個cell
        let width = (collectionView.bounds.width - 2 * 3) / 4
//        let height = width
//        let width = self.frame.width / 4
        let height = self.frame.height - 4
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
