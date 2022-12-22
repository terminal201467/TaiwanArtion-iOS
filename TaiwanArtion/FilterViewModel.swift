//
//  FilterViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay


class FilterViewModel {
    
    //MARK: -FakeData
    
    private let areaLocations: [AreaModel] = [
        AreaModel(area: "北部區域", locations: ["基隆", "台北", "新北", "桃園", "新竹", "宜蘭"]),
        AreaModel(area: "中部區域", locations: ["苗栗", "台中", "彰化", "南投", "雲林"]),
        AreaModel(area: "南部區域", locations: ["嘉義", "台南", "高雄", "屏東"]),
        AreaModel(area: "東部區域", locations: ["花蓮", "台東"]),
        AreaModel(area: "離島區域", locations: ["澎湖", "金門", "馬祖", "綠島", "蘭嶼"])
    ]
    
    lazy var areas = Observable.just(areaLocations)
    
    
    init() {
        
    }
    
}
