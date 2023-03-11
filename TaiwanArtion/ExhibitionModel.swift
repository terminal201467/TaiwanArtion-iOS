//
//  ExhibitionModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/16.
//

import Foundation


struct Exhibition: Codable {
    
    var name: String?
    var area: String?
    var holdPlace: String?
    var webSite: String?
    var photos: [String]?
    
}

struct ExhibitionModel: Codable {
    
    var version: String?
    var UID: String?
    var title: String?
    var category: String?
    var showInfo: [ShowInfo]?
    var showUnit: String?
    var discountInfo: String?
    var descriptionFilterHtml: String?
    var imageUrl: String?
    var masterUnit: [String]?
    var subUnit: [String]?
    var supportUnit: [String]?
    var otherUnit: [String]?
    var webSales: String?
    var sourceWebPromote: String?
    var comment: String?
    var editModifyDate: String?
    var sourceWebName: String?
    var startDate: String?
    var endDate: String?
    var hitRate: Int?
    
    struct ShowInfo: Codable {
        var time: String?
        var location: String?
        var locationName: String?
        var onSale: String?
        var price: String?
        var latitude: String?
        var lontitude: String?
        var endTime: String?
    }
    
}
