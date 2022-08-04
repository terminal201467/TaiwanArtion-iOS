//
//  ExhibitionSearchResultsTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/8/5.
//

import UIKit
import SnapKit

class SearchPageTableView: UITableView {

    
    
    // MARK: - Init
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(SearchResultsTableViewCell.self, forCellReuseIdentifier: SearchResultsTableViewCell.identifier)
        register(SearchRecordTableViewCell.self, forCellReuseIdentifier: SearchRecordTableViewCell.identifier)
//        backgroundColor = .secondarySystemBackground
        separatorStyle = .none
        separatorColor = .clear
//        allowsSelection = false
        dataSource = self
        delegate = self
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DataSource
extension SearchPageTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: SearchResultsTableViewCell.identifier, for: indexPath) as! SearchResultsTableViewCell
        
        
        return cell
    }
}

// MARK: - Delegate
extension SearchPageTableView: UITableViewDelegate {
    
}
