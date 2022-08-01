//
//  SeeAllExhibitionViewModel.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/8.
//

import Foundation
import RxCocoa
import RxSwift
import RxRelay

protocol SeeAllExhibitionViewModelInputs {
    var viewDidLoad: PublishRelay<()> { get }
}

protocol SeeAllExhibitionViewModelOutputs {
    var cellInfoList: Signal<[CellInfo]> { get }
}

protocol SeeAllExhibitionViewModelType {
    var inputs: SeeAllExhibitionViewModelInputs { get }
    var outputs: SeeAllExhibitionViewModelOutputs { get }
}

class SeeAllExhibitionViewModel:
    SeeAllExhibitionViewModelInputs,
    SeeAllExhibitionViewModelOutputs,
    SeeAllExhibitionViewModelType
{
    // MARK: - inputs
    var viewDidLoad: PublishRelay<()>
    
    
    // MARK: - outputs
    var cellInfoList: Signal<[CellInfo]>

    
    var inputs: SeeAllExhibitionViewModelInputs { self }
    var outputs: SeeAllExhibitionViewModelOutputs { self }
    
    private let disposeBag = DisposeBag()
    
    init() {
        let viewDidLoad = PublishRelay<()>()
        self.viewDidLoad = viewDidLoad
        
        let cellInfoList = PublishRelay<[CellInfo]>()
        self.cellInfoList = cellInfoList.asSignal()
        
        viewDidLoad
            .subscribe(onNext: { [weak self] in
                self?.loadCellInfo(cellInfoList: cellInfoList)
            })
            .disposed(by: disposeBag)
    }
    
    private func loadCellInfo(cellInfoList: PublishRelay<[CellInfo]>) {
        let info = [
            CellInfo(
                url: "1",
                title: "會動的文藝復興 1",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
            CellInfo(
                url: "2",
                title: "會動的文藝復興 2",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
            CellInfo(
                url: "3",
                title: "會動的文藝復興 3",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
            CellInfo(
                url: "1",
                title: "會動的文藝復興 4",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
            CellInfo(
                url: "2",
                title: "會動的文藝復興 5",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
            CellInfo(
                url: "3",
                title: "會動的文藝復興 6",
                startDate: "2020/03/21",
                endDate: "04/20",
                city: "台南市",
                township: "仁德區",
                price: "300"
            ),
        ]
        
        cellInfoList.accept(info)
    }
}
