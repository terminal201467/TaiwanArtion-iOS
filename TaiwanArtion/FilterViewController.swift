//
//  FilterViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay
import RxDataSources


class FilterViewController: UIViewController, UIScrollViewDelegate {
    
    private let filterView = FilterView()
    
    private var viewModel: FilterViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = filterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setFilterViewAction()
        setNavigationBar()
        
    }
    
    private func setCollectionView() {
        filterView.areaView.rx.setDelegate(self)
        let dataSource = RxCollectionViewSectionedReloadDataSource<AreaModel>(
            configureCell: { (dataSource, collectionView, indexPath, element) in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NorthAreaCell.identifier, for: indexPath) as! NorthAreaCell
                cell.areaLabel.text = "\(element)"
                return cell },
            configureSupplementaryView: {(ds, cv, kind, ip) in
                let sectionTitle = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitle.identifier, for: ip) as! SectionTitle
                sectionTitle.areaLabel.text = "\(ds[ip.section].area)"
                return sectionTitle
            })
        
        viewModel.areas
            .bind(to: filterView.areaView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setNavigationBar() {
        navigationItem.title = "選擇縣市"
    }
    
    private func setFilterViewAction() {
        filterView.correctActions = {
            self.navigationController?.popViewController(animated: true)
        }
        
        filterView.backLocationAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension FilterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 1 * 3) / 5
        let height = filterView.areaView.frame.height / 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}




