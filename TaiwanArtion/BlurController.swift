//
//  BlurController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit
import SnapKit

class BlurController: UIViewController {
    
    private let blurView = BlurView()
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = blurView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBlurView()
    }
    
    func setupBlurView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = view.frame
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        self.view.addSubview(blurView)
    }
}
