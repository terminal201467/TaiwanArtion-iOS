//
//  AddPhotoViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    

    private func setNavigationBar() {
        title = "選擇照片"
        let photoButton = UIBarButtonItem(image: UIImage(named: "TakePhoto"), style: .plain, target: self, action: #selector(takePhoto))
        navigationItem.rightBarButtonItem = photoButton
    }
    
    @objc func takePhoto() {
        //跳出照相機頁面
    }

}
