//
//  AreaTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit

class AreaTableView: UITableView {
    
    let testList: [Int] = [1, 2, 3, 4, 5, 6]

    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(AreaTableViewCell.self, forCellReuseIdentifier: AreaTableViewCell.identifier)
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

extension AreaTableView: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: AreaTableViewCell.identifier, for: indexPath) as! AreaTableViewCell
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        return cell
    }
    
    
}

extension AreaTableView: UITableViewDelegate {
    
}
