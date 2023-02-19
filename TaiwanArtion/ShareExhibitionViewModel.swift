//
//  ShareExhibitionViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/23.
//

import Foundation
import RxSwift

class ShareExhibitionViewModel {
    
    //MARK: -UI bindings
    
    private let shareDetail: [ExhibitionDetailModel] = [
        ExhibitionDetailModel(sectionName: "展覽名稱", cellName: ["輸入展覽名稱"]),
        ExhibitionDetailModel(sectionName: "展覽縣市", cellName: ["選擇縣市"]),
        ExhibitionDetailModel(sectionName: "展覽單位", cellName: ["選擇單位"]),
        ExhibitionDetailModel(sectionName: "網址", cellName: ["輸入網址"])
    ]
    
    lazy var tableItems = Observable.just(shareDetail)
    
    //MARK: - DateStore
    
    private var exhibition = Exhibition()

    //MARK: - Network
    
    //Post
    func post(with data:Exhibition) {
        
    }
    
    //Get
    func get() {
        
    }
    
    //Put
    
    //MARK: - DataActions
    func preview() -> String {
        guard exhibition.name != nil else { return "請輸入展覽名稱" }
        guard exhibition.area != nil else { return "請輸入地區名稱" }
        guard exhibition.holdPlace != nil else { return "請輸入展場" }
        guard exhibition.webSite != nil else { return "請輸入網址" }
        guard exhibition.photos != nil else { return "請選擇照片" }
        print("exhibition:\(exhibition)")
        return "資料無缺漏"
    }
    
    //MARK: - ReleaseAction
    func release() {
        post(with: self.exhibition)
    }
    
    func receivePlaceKind(with kind: String) {
        exhibition.holdPlace = kind
        print("exhibition.holdPlace:\(exhibition.holdPlace)")
    }
    
    func receiveCity(with city: String) {
        exhibition.area = city
        print("exhibition.area:\(exhibition.area)")
    }
    
    func receiveName(with name: String) {
        exhibition.name = name
        print("exhibition.name:\(exhibition.name)")
    }
    
    func receivePhotos(with photos: [String]) {
        exhibition.photos = photos
        print("exhibition.photos:\(exhibition.photos)")
    }
    
    func receiveWebSite(with site: String) {
        exhibition.webSite = site
        print("exhibition.webSite:\(exhibition.webSite)")
    }
}
