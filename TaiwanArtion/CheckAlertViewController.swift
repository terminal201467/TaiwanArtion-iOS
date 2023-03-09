//
//  CheckAlertViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/3.
//

import UIKit

class CheckAlertViewController: UIViewController {
    
    @IBOutlet var checkLogo: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var checkView: UIView!

    private var logo: String
    
    private var descriptions: String
    
    init(logo: String, descriptions: String) {
        self.logo = logo
        self.descriptions = descriptions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogo(with: logo)
        setDescriptionLabel(with: descriptions)
        setCheckView()
    }
    
    private func setCheckView() {
        checkView.addRoundedCorners(cornerRadius: 10)
    }
    
    private func setLogo(with logo: String) {
        checkLogo.image = UIImage(named: logo)
    }

    private func setDescriptionLabel(with description: String) {
        descriptionLabel.text = "已儲存至\(description) Calendar"
    }

}
