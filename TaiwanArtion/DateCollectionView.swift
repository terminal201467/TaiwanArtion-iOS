//
//  Day.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/24.
//

//import UIKit
//import JTAppleCalendar
//
//class DateCollectionView: JTAppleCalendarView {
//
//
//
//
    
//    convenience init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        self.init(frame: .zero, collectionViewLayout: layout)
//        backgroundColor = .backgroundColor
//        register(DateCell.self, forCellWithReuseIdentifier: DateCell.identifier)
//        isScrollEnabled = false
//        dataSource = self
//        delegate = self

//        self.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
//    }

//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//    }
//
//    required public init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// MARK: - DataSource
//extension DateCollectionView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 12
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCell.identifier, for: indexPath) as! MonthCell
//
//        return cell
//    }
//}
//
//// MARK: - Delegate
//extension DateCollectionView: UICollectionViewDelegate {
//
//}
//
////MARK: - CollectionViewDelegateFlowLayout
//extension DateCollectionView: UICollectionViewDelegateFlowLayout {
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // (collectionView.邊界.寬 - 間距大小 * cell有幾幾個間距) / 想要幾個cell
//        let width = (collectionView.bounds.width - 2 * 3) / 4
////        let height = width
////        let width = self.frame.width / 4
//        let height = self.frame.height - 4
//        return CGSize(width: width, height: height)
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
//}

//// MARK: - Calendar DataSource
//extension DateCollectionView: JTAppleCalendarViewDataSource {
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy MM dd"
//        let startDate = formatter.date(from: "2018 01 01")!
//        let endDate = Date()
//        return ConfigurationParameters(startDate: startDate, endDate: endDate)
//    }
//}
//
//// MARK: - Calendar Delegate
//extension DateCollectionView: JTAppleCalendarViewDelegate {
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
//        cell.dateLabel.text = cellState.text
//        return cell
//    }
//    
//    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        let cell = cell as! DateCell
//        cell.dateLabel.text = cellState.text
//    }
//}
