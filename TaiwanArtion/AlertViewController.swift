//
//  AlertViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/17.
//

import UIKit

class AlertViewController: UIViewController {
    
    //MARK: -Views
    private let whiteBackground: UIView = {
       let view = UIView()
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.clipsToBounds = true
        view.backgroundColor = .backgroundColor
        return view
    }()
    
    private let checkView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "Check")
        return view
    }()
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .textBlack464646
        label.text = "已將表單送出成功"
        return label
    }()
    
    private let correctButton: UIButton = {
       let button = UIButton()
        button.setTitle("確認", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(correctAction), for: .touchDown)
        button.backgroundColor = .brownColor
        button.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        return button
    }()
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
    }
    
    @objc private func correctAction() {
        dismiss(animated: true)
    }
    
    //MARK: -UI SetUp
    private func autoLayout() {
        view.addSubview(whiteBackground)
        whiteBackground.snp.makeConstraints { make in
            make.width.equalTo(252)
            make.height.equalTo(169)
            make.center.equalToSuperview()
        }
        
        view.addSubview(checkView)
        checkView.snp.makeConstraints { make in
            make.centerY.equalTo(whiteBackground.snp.top)
            make.centerX.equalTo(whiteBackground.snp.centerX)
        }
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.centerX.equalTo(whiteBackground.snp.centerX)
            make.centerY.equalTo(whiteBackground.snp.centerY)
        }
        
        view.addSubview(correctButton)
        correctButton.snp.makeConstraints { make in
            make.leading.equalTo(whiteBackground.snp.leading).offset(10)
            make.trailing.equalTo(whiteBackground.snp.trailing).offset(-10)
            make.bottom.equalTo(whiteBackground.snp.bottom).offset(-10)
            make.height.equalTo(40)
        }
    }
}
