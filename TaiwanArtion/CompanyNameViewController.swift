//
//  CompanyNameViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/5/19.
//

import UIKit
import SnapKit

class CompanyNameViewController: UIViewController {
    
    private let filterPositionButtons = FilterPositionButtons()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("確定", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .brownColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    //MARK: - Setup UI
    private func setupUI() {
        view.tag = 1
        view.backgroundColor = .backgroundColor

        view.addSubview(filterPositionButtons)
        filterPositionButtons.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(95)
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(filterPositionButtons.snp.bottom).offset(24)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(40)
        }
    }
}
