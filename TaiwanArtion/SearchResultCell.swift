//
//  SearchResultTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/29.
//

import UIKit
import SnapKit

class SearchResultCell: UITableViewCell {

    static let identifier = "SearchResultCell"
    
//    weak var cellDelegate: SearchResultCellDelegate?
        
    // MARK: - UIs
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let exhibitionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "3"))
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 23
        imageView.clipsToBounds = true
        return imageView
    }()
        
    private let exhibitionName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "會動的文藝復興"
        return label
    }()
    
    private let exhibitionDate: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .gray
        label.text = "2020/3/21～04/20"
        return label
    }()
    
    private
    lazy var landmarkAndCityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [landmarkImageView, exhibitionCity])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let exhibitionCity: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "台南市，仁德區"
        return label
    }()
    
    private let exhibitionPrice: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = .brownColor
        label.textAlignment = .center
        label.textColor = .white
//        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = "$300"
        return label
    }()
    
    private let landmarkImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Map"))
        return imageView
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        selectionStyle = .none
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.leading.equalTo(10)
            make.bottom.trailing.equalTo(-10)
        }
        
        backView.addSubview(exhibitionImageView)
        exhibitionImageView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(17)
            make.leading.equalTo(backView.snp.leading).offset(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(170)
        }
        
        backView.addSubview(exhibitionName)
        exhibitionName.snp.makeConstraints { make in
            make.top.equalTo(exhibitionImageView.snp.bottom).offset(18)
            make.leading.equalTo(backView.snp.leading).offset(16)
        }
        
        backView.addSubview(exhibitionDate)
        exhibitionDate.snp.makeConstraints { make in
            make.top.equalTo(exhibitionName.snp.bottom).offset(8)
            make.leading.equalTo(backView.snp.leading).offset(16)
        }
        
        backView.addSubview(landmarkAndCityStackView)
        landmarkAndCityStackView.snp.makeConstraints { make in
            make.top.equalTo(exhibitionImageView.snp.bottom).offset(20)
            make.trailing.equalTo(backView.snp.trailing).offset(-16)
            make.centerY.equalTo(exhibitionName.snp.centerY)
        }
        
        landmarkImageView.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        
        backView.addSubview(exhibitionPrice)
        exhibitionPrice.snp.makeConstraints { make in
            make.top.equalTo(landmarkAndCityStackView.snp.bottom).offset(11)
            make.trailing.equalTo(backView.snp.trailing).offset(-16)
            make.centerY.equalTo(exhibitionDate.snp.centerY)
        }
        
        exhibitionPrice.snp.makeConstraints { make in
            make.width.equalTo(55)
        }
    }
}
