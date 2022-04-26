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
    let recentExhibitionImageView: UIImageView = {
        let imageView = UIImageView()
        
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
        label.text = "會動的文藝復興"
        return label
    }()
    
    let exhibitionDate: UILabel = {
        let label = UILabel()
        label.text = "2020/3/21～04/20"
        return label
    }()
    
    lazy
    var priceAndCityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exhibitionPrice, exhibitionCity])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let exhibitionPrice: UILabel = {
        let label = UILabel()
        label.text = "$300"
        return label
    }()
    
    let exhibitionCity: UILabel = {
        let label = UILabel()
        label.text = "台南市，仁德區"
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        contentView.addSubview(recentExhibitionImageView)
        recentExhibitionImageView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.top.equalTo(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        contentView.addSubview(nameAndDateStackView)
        nameAndDateStackView.snp.makeConstraints { make in
            make.top.equalTo(recentExhibitionImageView.snp.bottom).offset(10)
            make.leading.equalTo(10)
        }
        
        contentView.addSubview(priceAndCityStackView)
        priceAndCityStackView.snp.makeConstraints { make in
            make.top.equalTo(recentExhibitionImageView.snp.bottom).offset(10)
            make.trailing.equalTo(-10)
        }
    }
}
