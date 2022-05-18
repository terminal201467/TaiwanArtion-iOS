//
//  FindExhibitionTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/20.
//

import UIKit
import SnapKit
import Reusable

class FindExhibitionTableViewCell: UITableViewCell, Reusable {
    
    static let identifier = "FindExhibitionTableViewCell"
    
    //MARK: - UIs
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.1
        view.layer.cornerRadius = 20
        return view
    }()
    
    let recentExhibitionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 23
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy
    var nameAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exhibitionName, exhibitionDate])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let exhibitionName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.text = "會動的文藝復興"
        return label
    }()
    
    let exhibitionDate: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "2020/3/21～04/20"
        return label
    }()
    
    lazy
    var priceAndCityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exhibitionCity, exhibitionPrice])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    let exhibitionPrice: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = .brown
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "$300"
        return label
    }()
    
    let exhibitionCity: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "台南市，仁德區"
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        backView.addSubview(recentExhibitionImageView)
        recentExhibitionImageView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.leading.equalTo(10)
        }
        
        backView.addSubview(nameAndDateStackView)
        nameAndDateStackView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(recentExhibitionImageView.snp.trailing).offset(10)
            
        }

        backView.addSubview(priceAndCityStackView)
        priceAndCityStackView.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.leading.equalTo(recentExhibitionImageView.snp.trailing).offset(10)
        }
    }
}
