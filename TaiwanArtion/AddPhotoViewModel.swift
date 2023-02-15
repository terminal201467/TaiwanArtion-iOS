//
//  AddPhotoViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import Foundation

struct SelectedItem {
    
    var name: String
    var indexRow: Int
}


class AddPhotoViewModel {
    
    var photos: [String] = ["1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"]
    
    var selectedItems:[String] = []

    var selectedOrders:[Int:Int] = [:]
    
    //MARK: - collectionView setting
    func numberOfItemsInSection(section: Int) -> Int{
        photos.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> String {
        photos[indexPath.row]
    }
    
    func cellForSelectedItemAt(indexPath: IndexPath) -> Bool {
        selectedItems.contains(photos[indexPath.row])
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
//        if selectedOrders.isEmpty {
//            selectedItems.append(photos[indexPath.row])
//            selectedOrders[indexPath.row] = selectedItems.count
//        } else {
//            //如果不是空的字典
//            //先判斷selectedOrders裡面是不是有選過的indexPath.row
//            for order in selectedOrders {
//                //如果排序的indexPath跟選單的目錄重複
//            }
//        }
//        print("selectedItems:\(selectedItems)")
//        print("selectedOrders:\(selectedOrders)")
    }
    
    func cellForCountNumber(indexPath: IndexPath) -> Int {
        if let order = selectedOrders[indexPath.row] {
            return order
        } else {
            return 0
        }
    }
    
}
