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
    
    private var isCellSelected: Bool = false
    
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
        setPhotoGallery()
    }
    

    private func setNavigationBar() {
        title = "選擇照片"
        navigationController?.navigationBar.prefersLargeTitles = false
        let photoButton = UIBarButtonItem(image: UIImage(named: "TakePhoto"), style: .plain, target: self, action: #selector(takePhoto))
        navigationItem.rightBarButtonItem = photoButton
    }
    
    private func setPhotoGallery() {
        addPhotoView.photoGallery.delegate = self
        addPhotoView.photoGallery.dataSource = self
    }
    
    @objc func takePhoto() {
        //跳出照相機頁面
    }

}

extension AddPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGalleryCollectionViewCell.identifier, for: indexPath) as! PhotoGalleryCollectionViewCell
        cell.configure(imageName: viewModel.cellForItemAt(indexPath: indexPath),
                       isSelected: viewModel.cellForSelectedItemAt(indexPath: indexPath),
                       countNumber: viewModel.cellForCountNumber(indexPath: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGalleryCollectionViewCell.identifier, for: indexPath) as! PhotoGalleryCollectionViewCell
        viewModel.didSelectItemAt(indexPath: indexPath)
        //add
        if viewModel.cellForSelectedItemAt(indexPath: indexPath) {
            collectionView.reloadItems(at: [indexPath])
        } else {
            collectionView.reloadData()
        }
    }
    
}
