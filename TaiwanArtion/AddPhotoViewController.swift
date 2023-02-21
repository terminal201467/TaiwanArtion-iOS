//
//  AddPhotoViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/30.
//

import UIKit
import PhotosUI

class AddPhotoViewController: UIViewController {
    //MARK: -Properties
    private let addPhotoView = AddPhotoView()
    
    private let viewModel: AddPhotoViewModel
    
    var returnSelectedItems: (([String]) -> ())?
    
    private let pickerViewController: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        return picker
    }()
    
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
        setImagePicker()
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
    
    private func setImagePicker() {
        pickerViewController.delegate = self
    }
    
    @objc private func takePhoto() {
        present(pickerViewController, animated: true)
    }

}

extension AddPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGalleryCollectionViewCell.identifier, for: indexPath) as! PhotoGalleryCollectionViewCell
        cell.configure(imageName: viewModel.cellForItemAt(indexPath: indexPath),
                       countNumber: viewModel.cellForCountNumber(indexPath: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGalleryCollectionViewCell.identifier, for: indexPath) as! PhotoGalleryCollectionViewCell
        viewModel.didSelectItemAt(indexPath: indexPath)
        returnSelectedItems?(viewModel.provideTheSelectedItems())
        collectionView.reloadItems(at: [indexPath])
    }
}


extension AddPhotoViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProviders = results.map { $0.itemProvider }
                if let itemProvider = itemProviders.first, itemProvider.canLoadObject(ofClass: UIImage.self) {
                    let previousImage = viewModel.provideTheSelectedItems().first
                    print("previousImage:\(previousImage)")
                    itemProvider.loadObject(ofClass: UIImage.self) {[weak self] (image, error) in
                        DispatchQueue.main.async {
//                            guard let self = self,
//                                let image = image as? UIImage, self.imageViews.first?.image == previousImage else { return }
//                            self.imageViews.first?.image = image
                        }
                    }
                }
    }
    
    
    
}
