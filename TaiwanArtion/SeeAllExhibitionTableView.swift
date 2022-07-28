//
//  SeeAllExhibitionTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit

class SeeAllExhibitionTableView: UITableView {

    // MARK: - Init
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(FindExhibitionTableViewCell.self, forCellReuseIdentifier: FindExhibitionTableViewCell.identifier)
        backgroundColor = .backgroundColor
        separatorStyle = .none
        separatorColor = .clear
        allowsSelection = false
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

// MARK: - TableView DataSource
extension SeeAllExhibitionTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FindExhibitionTableViewCell.identifier, for: indexPath) as! FindExhibitionTableViewCell
        
        return cell
    }
}

// MARK: - TableView Delegate
extension SeeAllExhibitionTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
