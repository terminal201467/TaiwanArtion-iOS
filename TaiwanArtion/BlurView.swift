//
//  BlurView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit
import SnapKit

class BlurView: UIView {
    //MARK: - UIs
    let blurView: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: .none)
        blur.backgroundColor = .blurBackView
        return blur
    }()
    
    let buttonBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    lazy
    var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noLimitButton, weekButton, oneMonthButton, threeMonthButton])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    let noLimitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let weekButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let oneMonthButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let threeMonthButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        addSubview(blurView)
        blurView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        addSubview(buttonBackView)
        buttonBackView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalTo(200)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
        }
        
//        addSubview(cancelButton)
//        cancelButton.snp.makeConstraints { make in
//
//        }
//
//        addSubview(buttonStackView)
//        buttonStackView.snp.makeConstraints { make in
//
//        }
        
//
    }
}
