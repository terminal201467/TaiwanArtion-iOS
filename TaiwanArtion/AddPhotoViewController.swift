//
//  AddPhotoViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import UIKit

class AddPhotoViewController: UIViewController {
    //MARK: -Properties
    private let addPhotoView = AddPhotoView()
    
    let viewModel: AddPhotoViewModel
    
    init(viewModel: AddPhotoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = addPhotoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    

    private func setNavigationBar() {
        title = "選擇照片"
        navigationController?.navigationBar.prefersLargeTitles = false
        let photoButton = UIBarButtonItem(image: UIImage(named: "TakePhoto"), style: .plain, target: self, action: #selector(takePhoto))
        navigationItem.rightBarButtonItem = photoButton
    }
    
    private func setPhotoGallery() {
        
    }
    
    @objc func takePhoto() {
        //跳出照相機頁面
    }

}
