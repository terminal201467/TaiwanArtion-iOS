//
//  SearchBarTextField.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/13.
//

import UIKit

class SearchBarTextField: UITextField {
    
    convenience init() {
        self.init(frame: .zero)
        addConstraint(self.heightAnchor.constraint(equalToConstant: 40))
        backgroundColor = .systemGray6
        placeholder = "Search"
        font = .boldSystemFont(ofSize: 20)
        borderStyle = .none
        clearButtonMode = .whileEditing
        keyboardType = .default
        layer.cornerRadius = 10
        delegate = self
        let leftVeiwView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        self.leftView = leftVeiwView
        self.leftViewMode = .always
        let iconImage = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: 30))
        iconImage.image = UIImage(systemName: "magnifyingglass")
        iconImage.tintColor = .gray
        leftVeiwView.addSubview(iconImage)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchBarTextField: UITextFieldDelegate {
    
}
