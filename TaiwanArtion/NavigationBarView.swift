//
//  NavigationBarView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/10.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class NavigationBarView: UIView {
    
    private let disposeBag = DisposeBag()
    
    var findExhibitionAction: (()->(Void))?
    
    var findLocationAction: (()->(Void))?
    
    var sideMenuSelectionAction: (()->(Void))?
    
    var searchAction: (()->(Void))?
    
    //MARK: - UI settings
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"magnifyingglass"), for: .normal)
        button.isEnabled = true
        button.tintColor = .textBlack636363
        return button
    }()
    
    private let sideMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SideMenu"), for: .normal)
        return button
    }()
    
    private let findExhibitionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "尋找展覽"
        label.isHidden = true
        label.textColor = .brownColor
        return label
    }()
    
    private let findExhibitionButton: UIButton = {
        let button = UIButton()
        button.setTitle("尋找展覽", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addRoundedCorners(cornerRadius: 5)
        button.backgroundColor = .brownColor
        return button
    }()
    
    private let findLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("尋找地點", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addRoundedCorners(cornerRadius: 5)
        button.setTitleColor(UIColor.brownColor, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var findStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findExhibitionButton,findLocationButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    //MARK: - searchMode
    private var isSearchMode: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSearchButton()
        setPressFindButton()
        autoLayout()
        backgroundColor = .backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setSearchButton() {
        print("setSearchButton called")
        searchButton.rx.tap
            .bind { [unowned self] in
                self.isSearchMode.toggle()
                setModeSwitch(with: isSearchMode)
                searchAction?()
            }
            .disposed(by: disposeBag)
    }
    
    private func setModeSwitch(with isSearchMode: Bool) {
        if isSearchMode {
            searchButton.setImage(UIImage(systemName:"chevron.down"), for: .normal)
            findStackView.isHidden = true
            findExhibitionLabel.isHidden = false
            sideMenuButton.isHidden = true
        } else {
            //非搜尋模式
            searchButton.setImage(UIImage(systemName:"magnifyingglass"), for: .normal)
            findStackView.isHidden = false
            findExhibitionLabel.isHidden = true
            sideMenuButton.isHidden = false
        }
        
    }
    
    private func setPressFindButton() {
        findExhibitionButton.rx.tap
            .bind { [unowned self] in
                findExhibitionButton.backgroundColor = .brownColor
                findExhibitionButton.setTitleColor(.white, for: .normal)
                findLocationButton.backgroundColor = .white
                findLocationButton.setTitleColor(.brownColor, for: .normal)
                findExhibitionAction?()
            }
            .disposed(by: disposeBag)
        
        findLocationButton.rx.tap
            .bind { [unowned self] in
                findExhibitionButton.backgroundColor = .white
                findExhibitionButton.setTitleColor(.brownColor, for: .normal)
                findLocationButton.backgroundColor = .brownColor
                findLocationButton.setTitleColor(.white, for: .normal)
                findLocationAction?()
            }
            .disposed(by: disposeBag)
    }
    
    private func setSideMenuButton() {
        sideMenuButton.rx.tap
            .bind { [unowned self] in
                sideMenuSelectionAction?()
            }
            .disposed(by: disposeBag)
    }
    
    private func autoLayout() {
        addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(24.0 / 58.0)
            make.width.equalToSuperview().multipliedBy(24.0 / 390.0)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
        
        searchButton.imageView?.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        addSubview(findExhibitionLabel)
        findExhibitionLabel.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(24.0 / 58.0)
            make.width.equalToSuperview().multipliedBy(83.0 / 390.0)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        addSubview(sideMenuButton)
        sideMenuButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(40.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(24.0 / 58.0)
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        addSubview(findExhibitionButton)
        findExhibitionButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(93.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(24 / 58.0)
        }
        
        addSubview(findLocationButton)
        findLocationButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(93.0 / 390.0)
            make.height.equalToSuperview().multipliedBy(24 / 58.0)
        }
        
        addSubview(findStackView)
        findStackView.snp.makeConstraints { make in
            make.leading.equalTo(sideMenuButton.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(180.0 / 390.0)
        }
        
        
    }
    
}
