//
//  ChooseCalenderTableViewCell.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/2.
//

import UIKit

class ChooseCalenderTableViewCell: UITableViewCell {
    
    static let identifier: String = "ChooseCalenderTableViewCell"
    
    let calenderLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let calenderLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func autoLayout() {
        addSubview(calenderLogo)
        calenderLogo.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        addSubview(calenderLabel)
        calenderLabel.snp.makeConstraints { make in
            make.left.equalTo(calenderLogo.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(logoString: String?, calenderString: String?) {
        calenderLogo.image = UIImage(named: logoString ?? "")
        calenderLabel.text = calenderString
    }

}
