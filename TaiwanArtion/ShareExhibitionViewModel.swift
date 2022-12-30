//
//  ShareExhibitionViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/23.
//

import Foundation
import RxSwift

class ShareExhibitionViewModel {
    
    private let shareDetail: [ExhibitionDetailModel] = [
        ExhibitionDetailModel(sectionName: "展覽名稱", cellName: ["輸入展覽名稱"]),
        ExhibitionDetailModel(sectionName: "展覽縣市", cellName: ["選擇縣市"]),
        ExhibitionDetailModel(sectionName: "展覽單位", cellName: ["選擇單位"]),
        ExhibitionDetailModel(sectionName: "網址", cellName: ["輸入網址"])
    ]
    
    lazy var tableItems = Observable.just(shareDetail)
    
}
