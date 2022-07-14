//
//  SearchViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    //MARK: - Properties
    
    let pages = ["縣市", "單位名稱", "日期"]
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var pageViewIndex: Int = 0
    
    var viewControllers: [UIViewController] = [AreaViewController(), CompanyNameViewController(), DateViewController()]
    
    
    //MARK: - UIs
    
    private let searchBarTableView = SearchBarTableView()
    
    private let searchBarTextField = SearchBarTextField()
    private let whetherStartExhibitionView = WhetherStartExhibitionButton()

//    private let searchTextField: UITextField = {
//        let textField = UITextField()
//        textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 40))
//        textField.backgroundColor = .systemGray6
//        textField.placeholder = "Search"
//        textField.font = .boldSystemFont(ofSize: 20)
//        textField.borderStyle = .none
//        textField.clearButtonMode = .whileEditing
//        textField.keyboardType = .default
//        textField.layer.cornerRadius = 10
//        let leftVeiwView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
//        textField.leftView = leftVeiwView
//        textField.leftViewMode = .always
//        let iconImage = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: 30))
//        iconImage.image = UIImage(systemName: "magnifyingglass")
//        iconImage.tintColor = .gray
//        leftVeiwView.addSubview(iconImage)
//        return textField
//    }()
    
    private let tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(TabButtonCollectionViewCell.self, forCellWithReuseIdentifier: TabButtonCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let backView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        setupCollectionView()
        configurePageViewController()
    }
    
    //MARK: - SetNavigation
    private func setupNavigation() {
        navigationItem.title = "SearchTest"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    //MARK: - Setup CollectionView
    private func setupCollectionView() {
        tabCollectionView.dataSource = self
        tabCollectionView.delegate = self
        tabCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    //MARK: - ConfigurePageVC
    private func configurePageViewController() {
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .forward, animated: true)
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(searchBarTextField)
        searchBarTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(16)
            make.width.equalTo(270)
        }
        
        view.addSubview(whetherStartExhibitionView)
        whetherStartExhibitionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(searchBarTextField.snp.trailing).offset(8)
            make.trailing.equalTo(-16)
            make.height.equalTo(40)
        }
        
        view.addSubview(tabCollectionView)
        tabCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBarTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalTo(tabCollectionView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }

    
    //MARK: - Methods
    func pageViewChange(index: Int) -> UIViewController? {
        if index < 0 {
            return viewControllers.last
        } else if index > viewControllers.count - 1 {
            return viewControllers.first
        } else {
            return viewControllers[index]
        }
    }
}

//MARK: - CollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabButtonCollectionViewCell.identifier, for: indexPath) as! TabButtonCollectionViewCell
        cell.backgroundColor = .backgroundColor
        cell.pageLabel.text = pages[indexPath.row]
        return cell
    }
}

//MARK: - CollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item > pageViewIndex {
            pageViewIndex = indexPath.item
            pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .forward, animated: true)
        }
        
        if indexPath.item < pageViewIndex {
            pageViewIndex = indexPath.item
            pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .reverse, animated: true)
        }
    }
}

//MARK: - CollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // (collectionView.邊界.寬 - 間距大小 * cell有幾幾個間距) / 想要幾個cell
        let width = (collectionView.bounds.width - 1 * 3) / 4
//        let height = width
//        let width = tabCollectionView.frame.width / 3
        let height = tabCollectionView.frame.height - 4
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

//MARK: - PageVC DataSource
extension SearchViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        return pageViewChange(index: pageViewIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return pageViewChange(index: pageViewIndex + 1)
    }
}

//MARK: - PageVC Delegate
extension SearchViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                pageViewIndex = vc.view.tag
                tabCollectionView.selectItem(at: IndexPath(item: pageViewIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
            }
        }
    }
}

