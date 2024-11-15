//
//  EducationViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class EducationViewController: UIViewController {
    
    var educationView: EducationView!
    
    let systemImageNames = [
        "star.fill",
        "heart.fill",
        "bell.fill",
        "house.fill",
        "person.fill",
        "gearshape.fill",
        "globe.europe.africa.fill",
        "moon.fill",
        "cloud.fill",
        "sun.max.fill"
    ]
    
    override func loadView() {
        self.educationView = EducationView()
        view = educationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadArticles()
    }
    
    func loadArticles() {
        let sampleImages = systemImageNames.compactMap { UIImage(systemName: $0) }
        educationView.articleScrollView.loadArticles(with: sampleImages)
    }

}
