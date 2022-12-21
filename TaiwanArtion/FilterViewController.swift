//
//  FilterViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/20.
//

import UIKit

class FilterViewController: UIViewController {
    
    private let filterView = FilterView()

    init(viewModel: FilterViewModel) {
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
        
        // Do any additional setup after loading the view.
    }
    
    

}


