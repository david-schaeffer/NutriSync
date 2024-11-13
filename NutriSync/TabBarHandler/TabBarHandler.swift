//
//  TabBarHandler.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/12/24.
//

import UIKit

class TabBarHandler: NSObject, UITabBarControllerDelegate {
    var popUpView: PopUpView?
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let vcIndex = tabBarController.viewControllers!.firstIndex(of: viewController)!
        // if "Log selected" popUpView visible
        if vcIndex == 2 {
            // if popUpView is visible
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
        if let parentStackView = sender.superview?.superview as? PopUpView {
            parentStackView.removeFromSuperview()
        }
    }
    
    @objc func logMeal(_ sender: UIButton) {
        if let parentStackView = sender.superview?.superview as? PopUpView {
            parentStackView.removeFromSuperview()
        }
    }
    
    @objc func logEvent(_ sender: UIButton) {
        if let parentStackView = sender.superview?.superview as? PopUpView {
            parentStackView.removeFromSuperview()
        }
    }
}
