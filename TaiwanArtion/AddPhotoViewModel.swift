//
//  AddPhotoViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import Foundation


class AddPhotoViewModel {
    
    var photos: [String] = ["1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"
                            ,"1","2","3"]
    
    var selectedItems = Set<Int>()
    
    //MARK: - collectionView setting
    func numberOfItemsInSection(section: Int) -> Int{
        photos.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> String {
        photos[indexPath.row]
    }
    
    func cellForSelectedItemAt(indexPath: IndexPath) -> Bool {
        selectedItems.contains(indexPath.row)
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        if selectedItems.contains(indexPath.row) {
            selectedItems.remove(indexPath.row)
        } else {
            selectedItems.insert(indexPath.row)
        }
    }
    
    func cellForCountNumber(indexPath: IndexPath) -> Int {
        selectedItems.count
    }
    
    
}
