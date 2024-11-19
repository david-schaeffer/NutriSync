//
//  AppDelegate.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/1/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Check if this is first launch
        if isFirstLaunch() {
            // Create window if not already exists
            if window == nil {
                window = UIWindow(frame: UIScreen.main.bounds)
            }
            
            // Create and set root view controller to onboarding
            let onboardingVC = OnboardingViewController()
            onboardingVC.modalPresentationStyle = .fullScreen
            
            // Create a navigation controller if you want
            let navigationController = UINavigationController(rootViewController: onboardingVC)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    // Helper method to track first launch
    private func isFirstLaunch() -> Bool {
        let defaults = UserDefaults.standard
        let hasLaunchedBefore = defaults.bool(forKey: "NutriSyncFirstLaunch")
        
        if !hasLaunchedBefore {
            defaults.set(true, forKey: "NutriSyncFirstLaunch")
            return true
        }
        return false
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
