//
//  CellInfo.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/8/1.
//

import RxDataSources
import RxSwift
import RxCocoa

struct CellInfo {
    let url: String
    let title: String
    let startDate: String
    let endDate: String
    let city: String
    let township: String
    let price: String
}

struct ExhibitionLocationInfo {
    let exhibitionTitle: String
    let exhibitionImage: String
    let buisinessType: Bool
    let buisinessTime: String
    let location: String
    let distance: String
}

struct AreaModel {
    var area: String
    var locations: [String]
}

extension AreaModel: AnimatableSectionModelType {
    var identity: String {
        return area
    }
    
    var items: [String] {
        return locations
    }
    
    init(original: AreaModel, items: [String]) {
        self = original
        self.locations = items
    }
}
