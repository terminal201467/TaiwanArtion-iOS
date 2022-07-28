//
//  ExhibitionDetailViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/28.
//

import UIKit

class ExhibitionDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
    }
    
    private func setupNavigation() {
        // left Button
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
    }
    
    // MARK: - Methods
    @objc
    private func backButton() {
        navigationController?.popViewController(animated: true)
    }
}
