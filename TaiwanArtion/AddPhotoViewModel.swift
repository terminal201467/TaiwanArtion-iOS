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
    
    private var photos: [String] = ["1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"
                                    ,"1","2","3"]
    
    private var selectedItems: [String] = []

    private var selectedOrders: [Int:Int] = [:]
    
    //MARK: - localStoragePhotos
    func getPhotos() {
        
    }
    
    //MARK: - collectionView setting
    func numberOfItemsInSection(section: Int) -> Int{
        photos.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> String {
        photos[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        if let existingOrder = selectedOrders[indexPath.row] {
                if let indexToRemove = selectedItems.index(where: { $0 == photos[indexPath.row] }) {
                    selectedItems.remove(at: indexToRemove)
                    selectedOrders.removeValue(forKey: indexPath.row)
                }
            } else {
                selectedItems.append(photos[indexPath.row])
                selectedOrders[indexPath.row] = selectedItems.count
            }
    }
    
    func cellForCountNumber(indexPath: IndexPath) -> String {
        if let order = selectedOrders[indexPath.row] {
            return "\(order)"
        } else {
            return ""
        }
    }
    
    //MARK:- CRUD in the PhotoGallery
    func addPhoto(photo: String) {
        photos.append(photo)
    }
    
    func providePhotos() -> [String] {
        photos
    }
    
    func provideTheSelectedItems() -> [String] {
        selectedItems
    }
    
}
