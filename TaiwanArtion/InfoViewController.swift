//
//  ExhibitionInfoViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/31.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.tag = 0
        view.backgroundColor = .backgroundColor
    }

}
