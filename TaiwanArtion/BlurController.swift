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
        let tapToDismiss = UITapGestureRecognizer(target: self, action: #selector(tapToDismiss(_:)))
        blurView.blurBackView.addGestureRecognizer(tapToDismiss)
    }
    
    @objc func tapToDismiss(_ recognizer: UITapGestureRecognizer) {
            dismiss(animated: true, completion: nil)
        }

}
