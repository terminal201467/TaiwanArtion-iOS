//
//  SearchResultTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/29.
//

import UIKit

protocol SearchResultCellDelegate: AnyObject {
    func pushToExhibitionDetail()
}

class SearchResultTableView: UITableView {
    
    let testList: [Int] = [1, 2, 3, 4, 5, 6]
    
    weak var cellDelegate: SearchResultCellDelegate?
    
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(TotalExhibitionCell.self, forCellReuseIdentifier: TotalExhibitionCell.identifier)
        register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
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

// MARK: - DataSource
extension SearchResultTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return testList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = dequeueReusableCell(withIdentifier: TotalExhibitionCell.identifier, for: indexPath) as! TotalExhibitionCell
            return cell
        } else {
            let cell = dequeueReusableCell(withIdentifier: SearchResultCell.identifier, for: indexPath) as! SearchResultCell
            
            
            return cell
        }
    }
}

// MARK: - Delegate
extension SearchResultTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellDelegate?.pushToExhibitionDetail()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 300
        }
    }
}
