//
//  CalendarView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/27.
//

import UIKit
import SnapKit
import JTAppleCalendar

class CalendarView: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .backgroundColor
        layer.cornerRadius = 10
        
        setupUI()
        setupJTAppleCalendar()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIs
    private
    lazy var weekStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mondayLabel, tuesdayLabel, wednesLabel, thursdayLabel, fridayLabel, saturdayLabel, sundayLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()
    
    private let mondayLabel: UILabel = {
        let label = UILabel()
        label.text = "一"
        return label
    }()
    
    private let tuesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "二"
        return label
    }()
    
    private let wednesLabel: UILabel = {
        let label = UILabel()
        label.text = "三"
        return label
    }()
    
    private let thursdayLabel: UILabel = {
        let label = UILabel()
        label.text = "四"
        return label
    }()
    
    private let fridayLabel: UILabel = {
        let label = UILabel()
        label.text = "五"
        return label
    }()
    
    private let saturdayLabel: UILabel = {
        let label = UILabel()
        label.text = "六"
        return label
    }()
    
    private let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "日"
        return label
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let calendar: JTAppleCalendarView = {
        let calendar = JTAppleCalendarView()
        calendar.register(DateCell.self, forCellWithReuseIdentifier: DateCell.identifier)
        calendar.register(DateHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DateHeader.identifier)
        calendar.backgroundColor = .backgroundColor
        calendar.showsHorizontalScrollIndicator = false
        calendar.scrollingMode = .stopAtEachCalendarFrame
        calendar.allowsMultipleSelection = true
        calendar.isRangeSelectionUsed = true
        calendar.scrollDirection = .horizontal
        calendar.minimumLineSpacing = 0
        calendar.minimumInteritemSpacing = 0
//        calendar.rangeSelectionMode = .continuous
        return calendar
    }()
    
    private func setupJTAppleCalendar() {
        calendar.calendarDataSource = self
        calendar.calendarDelegate = self
    }
    
    // MARK: - Setup UI
    private func setupUI() {
//        addSubview(weekStackView)
//        weekStackView.snp.makeConstraints { make in
//            make.top.equalTo(20)
//            make.leading.equalTo(31)
//            make.trailing.equalTo(-31)
//            make.height.equalTo(15)
//        }
        
        addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.top.equalTo(0) //(weekStackView.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(300)
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
        
        cell.selectedView.isHidden = !cellState.isSelected
        switch cellState.selectedPosition() {
        case .left:
            cell.selectedView.layer.cornerRadius = 15
            cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        case .middle:
            cell.selectedView.layer.cornerRadius = 0
            cell.selectedView.layer.maskedCorners = []
        case .right:
            cell.selectedView.layer.cornerRadius = 15
            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        case .full:
            cell.selectedView.layer.cornerRadius = 15
            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        default: break
        }
    }
    
    private func calendarHeader(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy 年 MM 月"
        return formatter.string(from: date)
    }
}

// MARK: - Calendar DataSource
extension CalendarView: JTAppleCalendarViewDataSource {
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
extension CalendarView: JTAppleCalendarViewDelegate {
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
        return MonthSize(defaultSize: 100)
    }
}
