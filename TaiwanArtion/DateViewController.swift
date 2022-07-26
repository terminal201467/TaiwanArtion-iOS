//
//  DateViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/5/19.
//

import UIKit
import SnapKit
import JTAppleCalendar

class DateViewController: UIViewController {
    
    // MARK: - UIs
    private let monthCollectionView = MonthCollectionView()
    
    private let calendar: JTAppleCalendarView = {
        let calendar = JTAppleCalendarView()
        calendar.register(DateCell.self, forCellWithReuseIdentifier: DateCell.identifier)
        calendar.register(DateHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DateHeader.identifier)
        calendar.backgroundColor = .backgroundColor
        calendar.allowsMultipleSelection = true
        calendar.showsHorizontalScrollIndicator = false
        calendar.scrollingMode = .stopAtEachCalendarFrame
//        calendar.rangeSelectionMode = .continuous
//        calendar.allowsRangedSelection = true
        calendar.scrollDirection = .horizontal
//        calendar.scrollingMode = .stopAtEachSection
        calendar.minimumLineSpacing = 0
        calendar.minimumInteritemSpacing = 0
        return calendar
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("確定", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .brownColor
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupJTAppleCalendar()
    }
    
    private func setupJTAppleCalendar() {
        calendar.calendarDataSource = self
        calendar.calendarDelegate = self
    }
    
    private func setupUI() {
        view.tag = 2
        view.backgroundColor = .backgroundColor
        
        view.addSubview(monthCollectionView)
        monthCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(70)
        }
        
        view.addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.top.equalTo(monthCollectionView.snp.bottom).offset(30)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom).offset(24)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
    }
    
    // MARK: - Methods
    private func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }
    
    private func handleCellTextColor(cell: DateCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.textColor = UIColor.black
        } else {
            cell.dateLabel.textColor = UIColor.systemGray4
        }
    }
    
    private func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            cell.selectedView.layer.cornerRadius =  15
            cell.dateLabel.textColor = .white
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    private func calendarHeader(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy 年 MM 月"
        return formatter.string(from: date)
    }
}

// MARK: - Calendar DataSource
extension DateViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2022 01 01")!
        let endDate = Date()
        let configurationParameters =
            ConfigurationParameters(startDate: startDate,
                                    endDate: endDate,
                                    numberOfRows: 6,
                                    calendar: Calendar.current,
                                    generateInDates: .forAllMonths,
                                    generateOutDates: .tillEndOfGrid,
                                    firstDayOfWeek: .monday,
                                    hasStrictBoundaries: true)
        return configurationParameters
    }
}

// MARK: - Calendar Delegate
extension DateViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as! DateCell
        cell.dateLabel.text = cellState.text
        self.calendar(calendar, willDisplay: cell,
                      forItemAt: date,
                      cellState: cellState,
                      indexPath: indexPath)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        cell.dateLabel.text = cellState.text
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }

    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        return true
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: DateHeader.identifier, for: indexPath) as! DateHeader
        header.headerLabel.text = calendarHeader(date: range.start)
        
        return header
    }

    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
}
