//
//  FilterViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay


class FilterViewController: UIViewController {
    
    private let filterView = FilterView()
    
    private var viewModel: FilterViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = filterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setCorrectAction()
    }
    
    private func setCollectionView() {
        let dataSource = RxCollectionViewSe
        
    }
    
    private func setCorrectAction() {
        filterView.correctActions = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


