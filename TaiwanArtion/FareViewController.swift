//
//  FareViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/31.
//

import UIKit
import SnapKit

class FareViewController: UIViewController {
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.tag = 1
        view.backgroundColor = .backgroundColor
    }
}
