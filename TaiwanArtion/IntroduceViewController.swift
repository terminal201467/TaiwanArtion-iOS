//
//  IntroduceViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/31.
//

import UIKit
import SnapKit

class IntroduceViewController: UIViewController {
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.tag = 2
        view.backgroundColor = .backgroundColor
    }
}
