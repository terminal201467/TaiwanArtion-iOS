//
//  AreaTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit

class AreaTableView: UITableView {
    
    let testList: [Int] = [1, 2, 3, 4, 5, 6]
    
    
    // MARK: - Init
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(PositionTableViewCell.self, forCellReuseIdentifier: PositionTableViewCell.identifier)
        register(PositioningFilterTableViewCell.self, forCellReuseIdentifier: PositioningFilterTableViewCell.identifier)
        backgroundColor = .backgroundColor
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
extension AreaTableView: UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = dequeueReusableCell(withIdentifier: PositionTableViewCell.identifier, for: indexPath) as! PositionTableViewCell
//            cell.selectionStyle = .none
            return cell
        } else {
            let cell = dequeueReusableCell(withIdentifier: PositioningFilterTableViewCell.identifier, for: indexPath) as! PositioningFilterTableViewCell
            cell.textLabel?.text = "Cell \(indexPath.row + 1)"
            return cell
        }
    }
}

// MARK: - Delegate
extension AreaTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 100
    }
}
