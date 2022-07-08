//
//  BlurView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit
import SnapKit

//class BlurView: UIView {
//    //MARK: - UIs
//    let blurBackView: UIVisualEffectView = {
//        let blur = UIVisualEffectView(effect: .none)
//        blur.backgroundColor = .blurBackView
//        return blur
//    }()
//    
//    let buttonBackView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .gray
//        view.layer.cornerRadius = 10
//        return view
//    }()
//    
//    let cancelButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
//        button.contentVerticalAlignment = .fill
//        button.contentHorizontalAlignment = .fill
////        button.imageView?.contentMode = .scaleAspectFit
////        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        return button
//    }()
//    
//    lazy
//    var buttonStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [noLimitButton, weekButton, oneMonthButton, threeMonthButton])
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.spacing = 0
//        stackView.distribution = .equalSpacing
//        return stackView
//    }()
//    
//    let noLimitButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("不限", for: .normal)
//        return button
//    }()
//    
//    let weekButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("一週", for: .normal)
//        return button
//    }()
//    
//    let oneMonthButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("一個月", for: .normal)
//        return button
//    }()
//    
//    let threeMonthButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("三個月", for: .normal)
//        return button
//    }()
//    
//    //MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: - SetupUI
//    private func setupUI() {
//        addSubview(blurBackView)
//        blurBackView.snp.makeConstraints { make in
//            make.edges.equalTo(0)
//        }
//        
//        addSubview(buttonBackView)
//        buttonBackView.snp.makeConstraints { make in
//            make.height.equalTo(250)
//            make.width.equalTo(250)
//            make.centerY.equalTo(self.snp.centerY)
//            make.centerX.equalTo(self.snp.centerX)
//        }
//        
//        buttonBackView.addSubview(cancelButton)
//        cancelButton.snp.makeConstraints { make in
//            make.height.equalTo(30)
//            make.width.equalTo(30)
//            make.top.equalTo(10)
//            make.trailing.equalTo(-10)
//        }
//
//        buttonBackView.addSubview(buttonStackView)
//        buttonStackView.snp.makeConstraints { make in
//            make.top.equalTo(cancelButton.snp.bottom).offset(10)
//            make.bottom.equalTo(-15)
//            make.leading.equalTo(0)
//            make.trailing.equalTo(0)
//        }
//    }
//}
