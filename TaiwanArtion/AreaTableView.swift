//
//  AreaTableView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import UIKit

class AreaTableView: UITableView {
    
//    let testList: [Int] = [1, 2, 3, 4, 5, 6]
    
    
    // MARK: - Init
    convenience init() {
        self.init(frame: .zero, style: .plain)
        register(PositionTableViewCell.self, forCellReuseIdentifier: PositionTableViewCell.identifier)
        
        register(NorthTableViewCell.self, forCellReuseIdentifier: NorthTableViewCell.identifier)
        
        register(MiddleTableViewCell.self, forCellReuseIdentifier: MiddleTableViewCell.identifier)
        
        register(SouthTableViewCell.self, forCellReuseIdentifier: SouthTableViewCell.identifier)
        
        register(EastTableViewCell.self, forCellReuseIdentifier: EastTableViewCell.identifier)
        
        register(OuterIslandTableViewCell.self, forCellReuseIdentifier: OuterIslandTableViewCell.identifier)
        
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

// MARK: - DataSource
extension AreaTableView: UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else {
            return 1
        }
        
//        if section == 0 {
//            return 1
//        } else {
//            return 5
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = dequeueReusableCell(withIdentifier: PositionTableViewCell.identifier, for: indexPath) as! PositionTableViewCell
//            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = dequeueReusableCell(withIdentifier: NorthTableViewCell.identifier, for: indexPath) as! NorthTableViewCell
            
            return cell
        } else if indexPath.section == 2 {
            let cell = dequeueReusableCell(withIdentifier: MiddleTableViewCell.identifier, for: indexPath) as! MiddleTableViewCell
            
            return cell
        } else if indexPath.section == 3 {
            let cell = dequeueReusableCell(withIdentifier: SouthTableViewCell.identifier, for: indexPath) as! SouthTableViewCell
            
            return cell
        } else if indexPath.section == 4 {
            let cell = dequeueReusableCell(withIdentifier: EastTableViewCell.identifier, for: indexPath) as! EastTableViewCell
            
            return cell
        } else {
            let cell = dequeueReusableCell(withIdentifier: OuterIslandTableViewCell.identifier, for: indexPath) as! OuterIslandTableViewCell
            
            return cell
        }
    }
}

// MARK: - Delegate
extension AreaTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return nil
//        } else if section == 1 {
//            return "北部地區"
//        } else if section == 2 {
//            return "中部地區"
//        } else if section == 3 {
//            return "南部地區"
//        } else if section == 4 {
//            return "東部地區"
//        } else if section == 5 {
//            return "離島地區"
//        }
//        return nil
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 25
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else if indexPath.section == 1 {
            return 140
        } else if indexPath.section == 2 {
            return 140
        } else if indexPath.section == 3 {
            return 130
        } else if indexPath.section == 4 {
            return 130
        } else {
            return 300
        }
        
    }
}
