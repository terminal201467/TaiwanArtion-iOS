//
//  FindExhibitionTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/4.
//

import UIKit

class FindExhibitionTableView: UITableView {
    
    // MARK: - Properties
    let testList: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    weak var buttonDelegate: TableViewCellDelegate?
    
    // MARK: - Init
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(ScrollPhotoTableViewCell.self, forCellReuseIdentifier: ScrollPhotoTableViewCell.identifier)
        register(FilterTableViewCell.self, forCellReuseIdentifier: FilterTableViewCell.identifier)
        register(FindExhibitionTableViewCell.self, forCellReuseIdentifier: FindExhibitionTableViewCell.identifier)
//        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
extension FindExhibitionTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return testList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScrollPhotoTableViewCell.identifier, for: indexPath) as! ScrollPhotoTableViewCell
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell

        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.identifier, for: indexPath) as! FilterTableViewCell
            cell.selectionStyle = .none
            cell.buttonDelegate = buttonDelegate
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FindExhibitionTableViewCell.identifier, for: indexPath) as! FindExhibitionTableViewCell
//            let image = UIImage(named: "3")
//            cell.recentExhibitionImageView.image = image!
            return cell
        }
    }
}

// MARK: - TableView Delegate
extension FindExhibitionTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 675
        } else if indexPath.section == 1 {
            return 100
        } else {
            return 150
        }
    }
}
