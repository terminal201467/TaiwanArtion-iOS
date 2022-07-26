//
//  DateCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/24.
//

import UIKit
import SnapKit
import JTAppleCalendar

class DateCell: JTAppleCell {
    
    static let identifier = "DateCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = .brownColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(selectedView)
        selectedView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
