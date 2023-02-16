//
//  ShareExhibitionTextFieldTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/16.
//

import UIKit

class ShareExhibitionTextFieldTableViewCell: UITableViewCell{
    
    static let identifier: String = "ShareExhibitionTextFieldCell"
    
    var textChanged: ((String) -> (Void))?
    
    var textFieldTrigger: ((Bool) -> (Void))?

    let textField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        textField.clipsToBounds = true
        textField.tintColor = .whetherStartBorderGray
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.clearButtonMode = .whileEditing
        textField.textAlignment = .natural
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.allowsEditingTextAttributes = true
        textField.backgroundColor = .cardBackgroundGray
        textField.isUserInteractionEnabled = true
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
        setTextField()
        setTextFieldNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @objc private func valueChanged(_ textField: UITextField) {
        if let inputText = textField.text {
            print("inputText:\(inputText)")
            textChanged?(inputText)
        }
    }
    
    private func setTextField() {
        textField.delegate = self
    }
    
    private func autoLayout() {
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(45)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
    }
    
    private func setTextFieldNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if textField.isFirstResponder == true {
            textFieldTrigger?(true)
         }
    }

    @objc private func keyboardWillHide(notification: NSNotification){
        if textField.isFirstResponder == true {
            textFieldTrigger?(false)
        }
    }
    
}

extension ShareExhibitionTextFieldTableViewCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textFieldDidBeginEditing:\(textField.text)")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("textFieldDidEndEditing:\(textField.text)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
