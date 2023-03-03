//
//  ChooseCalendarViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/2.
//

import UIKit

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

class ChooseCalenderViewController: UIViewController {
    
    private let chooseCalenderView = ChooseCalenderView()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = chooseCalenderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setClose()
        setTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setClose() {
        chooseCalenderView.closeAction = {
            self.dismiss(animated: true)
        }
    }
    
    private func setTableView() {
        chooseCalenderView.tableView.delegate = self
        chooseCalenderView.tableView.dataSource = self
    }
}

extension ChooseCalenderViewController: UITableViewDelegate, UITableViewDataSource {
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
        dismiss(animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                switch CalendarKinds(rawValue: indexPath.row) {
                case .googleCalendar:
                    let googleAlert = AddCalendarViewController(logo: "GoogleCalendar", app: "Google")
                    self.presentOnTop(googleAlert, animated: true)
                case .iOSCalendar:
                    let iOSAlert = AddCalendarViewController(logo: "iOSCalendar", app: "iOS")
                    self.presentOnTop(iOSAlert, animated: true)
                case .none: print("none")
                }
            }
        }
    }
}
