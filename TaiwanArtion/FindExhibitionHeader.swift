//
//  FindExhibitionHeader.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SnapKit
import Reusable

class FindExhibitionHeader: UITableViewHeaderFooterView, Reusable {
    
    static let identifier = "FindExhibitionHeader"
    
    //MARK: - UIs
    lazy
    var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitlelabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "沒有想法嗎"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let subtitlelabel: UILabel = {
        let label = UILabel()
        label.text = "看看最近有什麼最新展覽吧！"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    let photoCarouselBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        contentView.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(10)
        }
        
        contentView.addSubview(photoCarouselBackView)
        photoCarouselBackView.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(16)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-16)
        }
    }
}
