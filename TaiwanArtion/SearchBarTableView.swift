//
//  SearchBarTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/13.
//

import UIKit

class SearchBarTableView: UITableView {
    
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(SearchBarCell.self, forCellReuseIdentifier: SearchBarCell.identifier)
        backgroundColor = .clear
        separatorStyle = .none
        separatorColor = .clear
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

//MARK: - DataSource
extension SearchBarTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarCell.identifier, for: indexPath) as! SearchBarCell
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        
        return cell
    }
}

//MARK: - Delegate
extension SearchBarTableView: UITableViewDelegate {
    
}
