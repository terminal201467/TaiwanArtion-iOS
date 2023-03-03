//
//  AddCalendarViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/3.
//

import UIKit

class AddCalendarViewController: UIViewController {
    
    //UIset
    @IBOutlet var calendarLogo: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var confirmButton: UIButton!
    
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var alertView: UIView!
    
    //Properties
    private var logo: String
    
    private var app: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAlertView()
        setLogo(with: logo)
        setButtons(with: "確認", with: "取消")
        setDescription(with: app)
    }
    
    init(logo: String, app: String) {
        self.logo = logo
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAlertView() {
        alertView.layer.cornerRadius = 10
        alertView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
        alertView.clipsToBounds = true
    }
    
    private func setLogo(with logo: String) {
        calendarLogo.image = UIImage(named: logo)
    }
    
    private func setButtons(with confirmString: String, with cancelString: String) {
        confirmButton.setTitle(confirmString, for: .normal)
        cancelButton.setTitle(cancelString, for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchDown)
    }
    
    private func setDescription(with app: String) {
        descriptionLabel.text = "將活動加入\(app) Calendar"
    }
    
    @objc private func confirmAction() {
        dismiss(animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.present("", animated: true)
            }
        }
    }
    
    @objc private func cancelAction() {
        dismiss(animated: true)
    }

}
