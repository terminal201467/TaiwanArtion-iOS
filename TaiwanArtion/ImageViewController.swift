//
//  ImageViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/20.
//

import UIKit

class ImageViewController: UIViewController {
    //MARK: - Properties
//    let imageViewController = ImageViewController()
    let imageView = ImageView()
    var image: UIImage?
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.photoImageView.image = image
        
    }
    
    
    
    
}
