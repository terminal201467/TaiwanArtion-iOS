//
//  NearByExhibitionView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/8.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa

class NearByExhibitionView: UIView {
    
    private let disposeBag = DisposeBag()

    var cityFilter: (() -> Void)?
    
    var dateFilter: (() -> Void)?
    
    let searchContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    let searchBar : UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder = "Search"
        return searchBar
    }()
    
    let cityFilterButton: UIButton = {
       let button = UIButton()
        button.setTitle("縣市", for: .normal)
        button.backgroundColor = .brownColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(cityFilterAction), for: .touchDown)
        return button
    }()
    
    let dateFilterButton: UIButton = {
       let button = UIButton()
        button.setTitle("日期", for: .normal)
        button.backgroundColor = .cardBackgroundGray
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.setTitleColor(.textGrayB0B0B0, for: .normal)
        button.addTarget(self, action: #selector(dateFilterAction), for: .touchDown)
        return button
    }()
    
    lazy var filterButtons: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [cityFilterButton, dateFilterButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    let navigationBar = NavigationBarView()
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        return mapView
    }()
    
    let listView: NearByExhibtionListView = {
       let view = NearByExhibtionListView()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        view.backgroundColor = .backgroundColor
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let navigatorDetailView: NavigateLocationView = {
       let view = NavigateLocationView()
        view.isHidden = true
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 10
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setMapViewLayout()
        setNavigationView()
        setNavigationBar()
        setSearchContainerView()
        setNavigatorDetailView()
        setListViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNavigationBar() {
        navigationBar.searchAction = {
            self.searchContainerView.isHidden.toggle()
        }
    }
    
    private func setSearchContainerView() {
        addSubview(searchContainerView)
        searchContainerView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(100.0 / 864.0)
        }
        
        searchContainerView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(358.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(40.0 / 100.0)
        }
        searchContainerView.addSubview(cityFilterButton)
        cityFilterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(83.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(30.0 / 100.0)
        }
        
        searchContainerView.addSubview(dateFilterButton)
        dateFilterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(83.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(30.0 / 100.0)
        }
        
        searchContainerView.addSubview(filterButtons)
        filterButtons.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(searchBar.snp.leading)
            make.width.equalToSuperview().multipliedBy(174.0 / 390)
            make.height.equalToSuperview().multipliedBy(30.0 / 100.0)
        }

    }
    
    private func setMapViewLayout() {
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setListViewLayout() {
        addSubview(listView)
        listView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(listView.moveMentY)
            make.height.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setNavigatorDetailView() {
        addSubview(navigatorDetailView)
        navigatorDetailView.snp.makeConstraints { make in
            make.height.equalTo(175)
            make.width.equalTo(358)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
    
    func setNavigationView() {
        addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(56.0 / 846.0)
        }
    }
    
    @objc func cityFilterAction() {
        cityFilter?()
    }
    
    @objc func dateFilterAction() {
        dateFilter?()
    }
}
