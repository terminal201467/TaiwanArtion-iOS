//
//  AddCalenderView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/3.
//

import UIKit

class AddCalenderView: UIView {

    private let backgroundview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    private let optionView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner ,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        
    }

}
