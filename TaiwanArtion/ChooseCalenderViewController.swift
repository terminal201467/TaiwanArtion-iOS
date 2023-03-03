//
//  ChooseCalendarViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/2.
//

import UIKit

class ChooseCalenderViewController: UIViewController {
    
    private let chooseCalenderView = ChooseCalenderView()
    
    override func loadView() {
        super.loadView()
        view = chooseCalenderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setClose()
        // Do any additional setup after loading the view.
    }
    
    private func setClose() {
        chooseCalenderView.closeAction = {
            self.dismiss(animated: true)
        }
    }
    

    

}
