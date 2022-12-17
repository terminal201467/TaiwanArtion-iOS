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

class NearbyExhibitionViewController: UIViewController {
    
    private let nearByExhibitionView = NearByExhibitionView()
    
    private var searchMode: Bool = false
    
    private let items = Observable.just(TitleType.allCases)
    
    private let disposeBag = DisposeBag()
    
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
        setNavigationMode()
        setSearchBarDelegate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    private func setNavigationMode() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(searchButtonPress))

        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonPress))
        
        searchButton.tintColor = .black
        menuButton.tintColor = .black
        self.navigationController?.navigationBar.tintColor = .backgroundColor
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.titleView = nearByExhibitionView.containerView
        nearByExhibitionView.searchContainerView.isHidden = true
    }
    
    private func setSearchMode() {
        let arrowButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(searchButtonPress))
        arrowButton.tintColor = .black
        navigationItem.rightBarButtonItem = arrowButton
        navigationItem.leftBarButtonItem = nil
        navigationItem.titleView = nearByExhibitionView.containerView
        nearByExhibitionView.searchContainerView.isHidden = false
    }
    
    private func setSearchBarDelegate() {
        nearByExhibitionView.searchBar.searchTextField.delegate = self
    }
    
    private func setMapView() {
        let location = CLLocationCoordinate2D(latitude: 22.999696, longitude: 120.212768)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        nearByExhibitionView.mapView.setRegion(region, animated: true)
    }
    
    private func setListView() {
        nearByExhibitionView.listView.slideUp = {
            let safeAreaInsetsTop = self.nearByExhibitionView.safeAreaInsets.top
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.frame.origin.y = safeAreaInsetsTop
                    self.nearByExhibitionView.listView.blackLine.alpha = 0.5
                    self.nearByExhibitionView.listView.showListTitle.alpha = 0.5
                } completion: { _ in
                    self.nearByExhibitionView.listView.blackLine.isHidden = true
                    self.nearByExhibitionView.listView.showListTitle.isHidden = true
                    self.nearByExhibitionView.listView.collectionItems.isHidden = false
                    self.nearByExhibitionView.listView.exhibitionList.isHidden = false
                }
            }
        }
        
        nearByExhibitionView.listView.slideDown = {
            let initListViewOriginY = self.nearByExhibitionView.safeAreaInsets.top + 550
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.frame.origin.y = initListViewOriginY
                    self.nearByExhibitionView.listView.blackLine.alpha = 0.5
                    self.nearByExhibitionView.listView.showListTitle.alpha = 0.5
                } completion: { _ in
                    self.nearByExhibitionView.listView.collectionItems.isHidden = true
                    self.nearByExhibitionView.listView.showListTitle.isHidden = true
                    self.nearByExhibitionView.listView.blackLine.alpha = 1
                    self.nearByExhibitionView.listView.showListTitle.alpha = 1
                    self.nearByExhibitionView.listView.blackLine.isHidden = false
                    self.nearByExhibitionView.listView.showListTitle.isHidden = false
                }
            }
        }
    }
    
    private func setItems() {
        items
            .bind(to: self.nearByExhibitionView.listView.collectionItems.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionCell.identifier, for: indexPath) as! ItemsCollectionCell
                cell.label.text = element.typeText
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    @objc private func searchButtonPress() {
        searchMode.toggle()
        searchMode ? setSearchMode() : setNavigationMode()
        nearByExhibitionView.searchMode.toggle()
    }
    
    @objc private func menuButtonPress() {
        
    }
}

extension NearbyExhibitionViewController: UITextFieldDelegate {
    
    
}
