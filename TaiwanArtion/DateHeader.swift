//
//  DateHeader.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/26.
//

import UIKit
import SnapKit
import JTAppleCalendar

class DateHeader: JTAppleCollectionReusableView {
    
    static let identifier = "DateHeader"
    
    // MARK: - UIs
    var headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
