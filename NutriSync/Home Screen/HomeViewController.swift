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
        navigationItem.rightBarButtonItem = profileButton
        
        let tapCalendar = UITapGestureRecognizer(target: self, action: #selector (openCalendar))
        homeView.monthlyProgressView.addGestureRecognizer(tapCalendar)
    }
    
    @objc func openCalendar() {
        let calendarVC = CalendarViewController()
        calendarVC.title = "Calendar"
        navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    @objc func openProfile() {
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
