//
//  ViewController.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView!
    
    override func loadView() {
        self.homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector (openProfile))
//        homeView.profileButton.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc func openProfile() {
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
