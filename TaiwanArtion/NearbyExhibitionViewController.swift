//
//  NearbyExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SideMenu
import RxSwift
import MapKit

class NearbyExhibitionViewController: UIViewController {
    
    private let nearByExhibitionView = NearByExhibitionView()
    
    private var searchMode: Bool = false
    
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
        nearByExhibitionView.listView.panUp = {
            print("panUp")
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.snp.makeConstraints { make in
                        make.height.equalToSuperview().multipliedBy(1/2)
                    }
                } completion: {_ in
                    self.nearByExhibitionView.listView.snp.makeConstraints { make in
                        make.top.equalTo(self.nearByExhibitionView.safeAreaLayoutGuide.snp.top)
                        make.leading.equalToSuperview()
                        make.trailing.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                }
            }
        }
        
        nearByExhibitionView.listView.panDown = {
            print("panDown")
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut) {
                    self.nearByExhibitionView.listView.snp.makeConstraints { make in
                        make.height.equalToSuperview().multipliedBy(1/2)
                    }
                } completion: {_ in
                    self.nearByExhibitionView.listView.snp.makeConstraints { make in
                        make.height.equalTo(50)
                        make.leading.equalToSuperview()
                        make.trailing.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                }
            }
        }
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
