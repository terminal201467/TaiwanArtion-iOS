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
    let backView: UIView = {
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
        addSubview(backView)
        backView.snp.makeConstraints { make in
            
        }
        
        addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            
        }
        
        addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            
        }
    }
}
