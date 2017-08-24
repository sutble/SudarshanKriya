//
//  OnboardingViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 3/19/17.
//
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList : [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: "Welcome")
        let vc2 = storyboard.instantiateViewController(withIdentifier: "Ujayi")
        let vc3 = storyboard.instantiateViewController(withIdentifier: "Bhastrika")
        let vc4 = storyboard.instantiateViewController(withIdentifier: "Aum")
        let vc5 = storyboard.instantiateViewController(withIdentifier: "Soham")
        let vc6 = storyboard.instantiateViewController(withIdentifier: "Rest")
        let vc7 = storyboard.instantiateViewController(withIdentifier: "Finish")

        
        return [vc1,vc2,vc3,vc4,vc5,vc6,vc7]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = viewControllerList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        viewController
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
   
}
