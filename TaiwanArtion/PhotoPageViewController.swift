//
//  PhotoPageVC.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/20.
//

import UIKit

class PhotoPageViewController: UIPageViewController {
    
//    let imageViewControllers: [ImageViewController] = [
//        .init(image: UIImage(named: "1"))
//    ]
//    let imageViewControllers = [ImageViewController()]
    
    
    //MARK: - Init
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewControllerDelegate()
    }
    
    //MARK: - SetupPageViewControllerDelegate
    func setupPageViewControllerDelegate() {
        dataSource = self
        delegate = self
        
    }
}

//MARK: - PageVC DataSource
extension PhotoPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        
        return nil
    }
}

//MARK: - PageVC Delegate
extension PhotoPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        
    }
}
