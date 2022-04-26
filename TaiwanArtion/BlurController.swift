//
//  BlurController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit

class BlurController: UIViewController {
    
    private let blurView = BlurView()
    
    override func loadView() {
        super.loadView()
        view = blurView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    

}
