//
//  NearbyExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SideMenu
import RxSwift
import RxCocoa
import RxRelay
import MapKit

class NearbyExhibitionViewController: UIViewController, UIScrollViewDelegate {
    
    private let nearByExhibitionView = NearByExhibitionView()
    
    private let viewModel: NearbyExhibitionViewModel
    
    private var searchMode: Bool = false
    
    private let items = Observable.just(TitleType.allCases)
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: NearbyExhibitionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = nearByExhibitionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setMapView()
        setListView()
        setItems()
        setExhibitionListBinding()
        setfilter()
        setStartNavigator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backToOrigin()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setMapView() {
        let location = CLLocationCoordinate2D(latitude: 22.999696, longitude: 120.212768)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        nearByExhibitionView.mapView.setRegion(region, animated: true)
    }
    
    private func setListView() {
        nearByExhibitionView.listView.slideUp = {
            let safeAreaInsetsTop = self.nearByExhibitionView.safeAreaInsets.top + self.nearByExhibitionView.navigationBar.frame.height
            print("safeAreaInsetsTop:\(safeAreaInsetsTop)")
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.frame.origin.y = safeAreaInsetsTop
                    self.nearByExhibitionView.listView.blackLine.alpha = 0.5
                    self.nearByExhibitionView.listView.showListTitle.alpha = 0.5
                    self.nearByExhibitionView.listView.collectionItems.selectItem(at: [0,0], animated: false, scrollPosition: .top)
                } completion: { _ in
                    self.nearByExhibitionView.listView.blackLine.isHidden = true
                    self.nearByExhibitionView.listView.showListTitle.isHidden = true
                    self.nearByExhibitionView.listView.collectionItems.isHidden = false
                    self.nearByExhibitionView.listView.exhibitionList.isHidden = false
                }
            }
        }
        
        nearByExhibitionView.listView.slideDown = {
            let initListViewOriginY = self.nearByExhibitionView.safeAreaInsets.top + self.view.frame.height * 600 / 864
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.frame.origin.y = initListViewOriginY
                    self.nearByExhibitionView.listView.blackLine.alpha = 0.5
                    self.nearByExhibitionView.listView.showListTitle.alpha = 0.5
                } completion: { _ in
                    self.backToOrigin()
                }
            }
        }
    }
    
    private func backToOrigin() {
        self.nearByExhibitionView.listView.collectionItems.isHidden = true
        self.nearByExhibitionView.listView.showListTitle.isHidden = true
        self.nearByExhibitionView.listView.exhibitionList.isHidden = true
        self.nearByExhibitionView.listView.blackLine.isHidden = false
        self.nearByExhibitionView.listView.showListTitle.isHidden = false
        self.nearByExhibitionView.listView.blackLine.alpha = 1
        self.nearByExhibitionView.listView.showListTitle.alpha = 1
    }
    
    private func setItems() {
        items
            .bind(to: self.nearByExhibitionView.listView.collectionItems.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabButtonCollectionViewCell.identifier, for: indexPath) as! TabButtonCollectionViewCell
                cell.pageLabel.text = element.typeText
                cell.pageLabel.font = .systemFont(ofSize: 16)
                return cell
            }
            .disposed(by: disposeBag)
        
        nearByExhibitionView.listView.collectionItems.rx.itemSelected.subscribe { indexPath in
            if let row = indexPath.element?.row {
                print("row:\(row)")
            }
        }
        .disposed(by: disposeBag)
        
        nearByExhibitionView.listView.collectionItems.delegate = self
//        nearByExhibitionView.listView.collectionItems.rx.itemHighlighted
//            .subscribe { indexPath in
//                let cell = self.nearByExhibitionView.listView.collectionItems.cellForItem(at: indexPath) as? ItemsCollectionCell
//                cell?.label.textColor = .brownColor
//            }
//            .disposed(by: disposeBag)


    }
    
    private func setExhibitionListBinding() {
        nearByExhibitionView.listView.exhibitionList.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.items
            .bind(to: nearByExhibitionView.listView.exhibitionList.rx.items) { (tableView, row, element) in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionListTableViewTableViewCell.identifier) as? ExhibitionListTableViewTableViewCell else { return UITableViewCell() }
                cell.configure(info: element)
                cell.selectionStyle = .none
                return cell
            }
            .disposed(by: disposeBag)
        
        nearByExhibitionView.listView.exhibitionList.rx.itemSelected.subscribe { indexPath in
            let maxY = self.nearByExhibitionView.frame.maxY
            UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut) {
                self.nearByExhibitionView.listView.frame.origin.y = maxY
            } completion: { _ in
                self.nearByExhibitionView.listView.isHidden = true
                UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut) {
                    self.nearByExhibitionView.navigatorDetailView.isHidden = false
                    self.nearByExhibitionView.navigatorDetailView.configure(info: ExhibitionLocationInfo(exhibitionTitle: "會動的文藝復興", exhibitionImage: "1", buisinessType: true, buisinessTime: "11:30-13:30", location: "臺灣,台南市", distance: "23"))
                }
            }
        }
        .disposed(by: disposeBag)
    }
    
    private func setfilter() {
        nearByExhibitionView.cityFilter = {
            DispatchQueue.main.async {
                let cityFilterController = FilterViewController(viewModel: FilterViewModel())
                self.navigationController?.pushViewController(cityFilterController, animated: true)
                self.navigationController?.navigationBar.tintColor = .brownColor
            }
        }
        
        nearByExhibitionView.dateFilter = {
            DispatchQueue.main.async {
                let dateViewController = DateViewController()
                self.navigationController?.pushViewController(dateViewController, animated: true)
                self.navigationController?.navigationBar.tintColor = .brownColor
            }
        }
    }
    
    private func setStartNavigator() {
        nearByExhibitionView.navigatorDetailView.startNavigator = {
            UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut) {
                self.nearByExhibitionView.navigatorDetailView.alpha = 0.5
            } completion: { _ in
                self.nearByExhibitionView.navigatorDetailView.isHidden = true
            }
            //先檢查手機有沒有GoogleMap
            //如果有，就跳轉到GoogleMap
        }
    }
}

extension NearbyExhibitionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 1 * 3) / 5
        let height = collectionView.frame.height - 10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

