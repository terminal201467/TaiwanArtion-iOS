//
//  SearchResultViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/28.
//

import UIKit
import SnapKit

class SearchResultViewController: UIViewController {

    // MARK: - UIs
    private let tableView = SearchResultTableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        tableView.cellDelegate = self
    }
    
    // MARK: - Setup Navigation
    private func setupNavigation() {
        navigationItem.title = "SearchResult"
        
        // left Button
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    @objc
    private func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SearchResultViewController: SearchResultCellDelegate {
    func pushToExhibitionDetail() {
        let vc = ExhibitionDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
