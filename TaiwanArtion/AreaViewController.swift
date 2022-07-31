//
//  AreaViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/5/19.
//

import UIKit
import SnapKit

class AreaViewController: UIViewController {
    
    // MARK: - UIs
//    private let tableView = AreaTableView()
    
    private let currentMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let currentTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("目前所在位置", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    private let unlimitedMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let unlimitedTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("不限區域", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    
    private let northAreaButtons = NorthAreaButtons()
    private let northAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "北部地區"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let northSelectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    
    private let middleAreaButtons = MiddleAreaButtons()
    private let middleAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "中部地區"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let middleSelectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    
    private let southAreaButtons = SouthAreaButtons()
    private let southAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "南部地區"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let southSelectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    
    private let eastAreaButtons = EastAreaButtons()
    private let eastAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "東部地區"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let eastSelectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    
    private let outerIslandAreaButtons = OuterIslandAreaButtons()
    private let outerIslandAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "離島地區"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let outerIslandSelectAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("全選", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("確定", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .brownColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        confirmButton.addTarget(self, action: #selector(test), for: .touchUpInside)
    }
    
    @objc func test() {
        let vc = SearchResultViewController()
//        let vc = ExhibitionDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.tag = 0
        view.backgroundColor = .backgroundColor
        
        view.addSubview(currentMarkButton)
        currentMarkButton.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(16)
            make.height.width.equalTo(30)
        }
        
        view.addSubview(currentTextButton)
        currentTextButton.snp.makeConstraints { make in
            make.centerY.equalTo(currentMarkButton.snp.centerY)
            make.leading.equalTo(currentMarkButton.snp.trailing).offset(8)
        }
        
        view.addSubview(unlimitedMarkButton)
        unlimitedMarkButton.snp.makeConstraints { make in
            make.top.equalTo(currentMarkButton.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.height.width.equalTo(30)
        }
        
        view.addSubview(unlimitedTextButton)
        unlimitedTextButton.snp.makeConstraints { make in
            make.centerY.equalTo(unlimitedMarkButton.snp.centerY)
            make.leading.equalTo(unlimitedMarkButton.snp.trailing).offset(8)
        }
        
        view.addSubview(northAreaLabel)
        northAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(unlimitedMarkButton.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        view.addSubview(northSelectAllButton)
        northSelectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(northAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        view.addSubview(northAreaButtons)
        northAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(northAreaLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(55)
        }
        
        view.addSubview(middleAreaLabel)
        middleAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(northAreaButtons.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        view.addSubview(middleSelectAllButton)
        middleSelectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(middleAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        view.addSubview(middleAreaButtons)
        middleAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(middleAreaLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(55)
        }
        
        view.addSubview(southAreaLabel)
        southAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(middleAreaButtons.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        view.addSubview(southSelectAllButton)
        southSelectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(southAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        view.addSubview(southAreaButtons)
        southAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(southAreaLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(25)
        }
        
        view.addSubview(eastAreaLabel)
        eastAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(southAreaButtons.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        view.addSubview(eastSelectAllButton)
        eastSelectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(eastAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        view.addSubview(eastAreaButtons)
        eastAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(eastAreaLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(25)
        }
        
        view.addSubview(outerIslandAreaLabel)
        outerIslandAreaLabel.snp.makeConstraints { make in
            make.top.equalTo(eastAreaButtons.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        view.addSubview(outerIslandSelectAllButton)
        outerIslandSelectAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(outerIslandAreaLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        view.addSubview(outerIslandAreaButtons)
        outerIslandAreaButtons.snp.makeConstraints { make in
            make.top.equalTo(outerIslandAreaLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(55)
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(outerIslandAreaButtons.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(30)
        }
    }
}
