//
//  ExhibitionDetailViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/28.
//

import UIKit

class ExhibitionDetailViewController: UIViewController {
    
    // MARK: - UIs
    
    
    
    // MARK: - Lifecycle
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
        
        // right Button
        let rightCalendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .plain, target: self, action: #selector(rightCalendarButton))
        rightCalendarButton.tintColor = .black
        
        let rightShareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(rightShareButton))
        rightShareButton.tintColor = .black
        self.navigationItem.rightBarButtonItems = [rightShareButton, rightCalendarButton]
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
    }
    
    // MARK: - Methods
    @objc
    private func backButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func rightCalendarButton(_ sender: UIBarButtonItem) {
        
    }
    
    @objc
    private func rightShareButton(_ sender: UIBarButtonItem) {
        
    }
}
