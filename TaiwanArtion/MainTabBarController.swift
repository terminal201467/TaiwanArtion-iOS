//
//  MainController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    //MARK: - SetupTabBar
    func setupTabBarController() {
        let findVC = FindExhibitionViewController()
        let findController = UINavigationController(rootViewController: findVC)
        findController.tabBarItem.image = UIImage(systemName: "star.fill")
        findController.tabBarItem.title = "早找展覽"
        
        let nearbyVC = NearbyExhibitionViewController()
        let nearbyController = UINavigationController(rootViewController: nearbyVC)
        nearbyController.tabBarItem.image = UIImage(systemName: "star.fill")
        nearbyController.tabBarItem.title = "附近展覽"
        
        let shareVC = ShareExhibitionViewController()
        let shareController = UINavigationController(rootViewController: shareVC)
        shareController.tabBarItem.image = UIImage(systemName: "star.fill")
        shareController.tabBarItem.title = "分享展覽"
        
        viewControllers = [findController, nearbyController, shareController]
    }
}
