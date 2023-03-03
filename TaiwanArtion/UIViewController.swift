//
//  UIWindow.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/17.
//

import UIKit

extension UIViewController {
    func presentOnTop(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(viewControllerToPresent, animated: animated, completion: completion)
        }
    }
}

