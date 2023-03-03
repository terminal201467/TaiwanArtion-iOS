//
//  ChooseCalendarView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/2.
//

import UIKit
import SnapKit

class ChooseCalenderView: UIView {
    
    var closeAction: (()->(Void))?
    
    private let backgroundview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    private let closeButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(close), for: .touchDown)
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    private let optionView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ChooseCalenderTableViewCell.self, forCellReuseIdentifier: ChooseCalenderTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func autoLayout() {
        addSubview(backgroundview)
        backgroundview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(optionView)
        optionView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        optionView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        optionView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom)
            make.left.equalTo(optionView.snp.left).offset(20)
            make.right.equalTo(optionView.snp.right)
            make.bottom.equalTo(optionView.snp.bottom)
        }
        
    }
    
    @objc func close() {
        closeAction?()
    }
    
}
