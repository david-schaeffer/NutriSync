//
//  TabBarHandler.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/12/24.
//

import UIKit

class TabBarHandler: NSObject, UITabBarControllerDelegate {
    
    let userId: Int = 1
    
    var popUpView: PopUpView?
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let vcIndex = tabBarController.viewControllers!.firstIndex(of: viewController)!
        
        // if "Log" selected
        if vcIndex == 2 {
            // if popUpView is not visible
            if popUpView == nil {
                popUpView = PopUpView()
                popUpView!.logMoodButton.addTarget(self, action: #selector(logMood), for: .touchUpInside)
                popUpView!.logMealButton.addTarget(self, action: #selector(logMeal), for: .touchUpInside)
                popUpView!.logEventButton.addTarget(self, action: #selector(logEvent), for: .touchUpInside)
                popUpView!.translatesAutoresizingMaskIntoConstraints = false
                
                let currentView = tabBarController.selectedViewController!.view!
                currentView.addSubview(popUpView!)
                popUpView!.bottomAnchor.constraint(equalTo: tabBarController.tabBar.topAnchor).isActive = true
                popUpView!.widthAnchor.constraint(equalTo: tabBarController.view.widthAnchor).isActive = true
                popUpView!.leadingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor).isActive = true
                
                currentView.bringSubviewToFront(popUpView!)
                
            } else {
                popUpView!.removeFromSuperview()
                popUpView = nil
            }
            
            return false
        } else {
            // if popUpView is visible
            if popUpView != nil {
                // remove popUpView
                popUpView!.removeFromSuperview()
                popUpView = nil
            }
            
            return true
        }
    }
    
    @objc func logMood(_ sender: UIButton) {
        if let tabBC = sender.window?.rootViewController as? UITabBarController {
            popUpView?.removeFromSuperview()
            popUpView = nil
            
            let currentTabIndex = tabBC.selectedIndex
            
            let logNavigationController = tabBC.viewControllers?[currentTabIndex] as? UINavigationController
            let logMoodVC = LogMoodViewController(userId: self.userId)
            logNavigationController?.pushViewController(logMoodVC, animated: true)
        }
    }
    
    @objc func logMeal(_ sender: UIButton) {
        if let tabBC = sender.window?.rootViewController as? UITabBarController {
            popUpView?.removeFromSuperview()
            popUpView = nil
            
            let currentTabIndex = tabBC.selectedIndex
            
            let logNavigationController = tabBC.viewControllers?[currentTabIndex] as? UINavigationController
            let logMealVC = LogMealViewController(userId: self.userId)
            logNavigationController?.pushViewController(logMealVC, animated: true)
        }
    }
    
    @objc func logEvent(_ sender: UIButton) {
        if let tabBC = sender.window?.rootViewController as? UITabBarController {
            popUpView?.removeFromSuperview()
            popUpView = nil
            
            let currentTabIndex = tabBC.selectedIndex
            
            let logNavigationController = tabBC.viewControllers?[currentTabIndex] as? UINavigationController
            let logEventVC = LogEventViewController(userId: self.userId)
            logNavigationController?.pushViewController(logEventVC, animated: true)
        }
    }
}
