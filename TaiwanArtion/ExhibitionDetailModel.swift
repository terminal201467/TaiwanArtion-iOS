//
//  ShareExhibitionModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/26.
//

import Foundation
import Differentiator
import RxSwift
import RxCocoa


struct ExhibitionDetailModel {
    var sectionName: String
    var cellName: [String]
}


extension ExhibitionDetailModel: AnimatableSectionModelType {
    var identity: String {
        return sectionName
    }
    
    var items: [String] {
        return cellName
    }
    
    init(original: ExhibitionDetailModel, items: [String]) {
        self = original
        self.cellName = items
    }
}
