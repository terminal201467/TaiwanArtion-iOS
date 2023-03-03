//
//  ChooseCalendarView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/2.
//

import UIKit
import SnapKit

enum CalendarKinds: Int, CaseIterable {
    case googleCalendar = 0, iOSCalendar
    var logo: String {
        switch self {
        case .googleCalendar: return "GoogleCalendar"
        case .iOSCalendar: return "iOSCalendar"
        }
    }
    
    var title: String {
        switch self {
        case .googleCalendar: return "Google Calendar"
        case .iOSCalendar: return "iOS 行事曆"
        }
    }
}

class ChooseCalenderView: UIView {
    
    var closeAction: (()->(Void))?
    
    private let backgroundview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    private let closeButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(close), for: .touchDown)
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    private let optionView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ChooseCalenderTableViewCell.self, forCellReuseIdentifier: ChooseCalenderTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func autoLayout() {
        addSubview(backgroundview)
        backgroundview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(optionView)
        optionView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        optionView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        optionView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom)
            make.left.equalTo(optionView.snp.left).offset(20)
            make.right.equalTo(optionView.snp.right)
            make.bottom.equalTo(optionView.snp.bottom)
        }
        
    }
    
    @objc func close() {
        closeAction?()
    }
    
}

extension ChooseCalenderView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CalendarKinds.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kinds = CalendarKinds(rawValue: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseCalenderTableViewCell.identifier, for: indexPath) as! ChooseCalenderTableViewCell
        cell.configure(logoString: kinds?.logo, calenderString: kinds?.title)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row:\(indexPath.row)")
    }
}
