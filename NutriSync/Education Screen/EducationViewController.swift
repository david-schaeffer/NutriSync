//
//  EducationViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class EducationViewController: UIViewController {
    
    var educationView: EducationView!
    
    let todaysArticles: [ArticleThumbnail] = [
        ArticleThumbnail(id: UUID().uuidString, title: "Article 1 with a long title to see what happens", backgroundImage: UIImage(systemName: "heart.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Article 2", backgroundImage: UIImage(systemName: "person.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Article 3", backgroundImage: UIImage(systemName: "book.fill")!),
    ]
    
    let sadArticles: [ArticleThumbnail] = [
        ArticleThumbnail(id: UUID().uuidString, title: "Don't Worry, Be Happy", backgroundImage: UIImage(systemName: "face.smiling")!),
        ArticleThumbnail(id: UUID().uuidString, title: "The Mind-Gut Connection", backgroundImage: UIImage(systemName: "carrot.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Happy Foods", backgroundImage: UIImage(systemName: "birthday.cake.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Fourth Article", backgroundImage: UIImage(systemName: "4.circle.fill")!),
    ]
    
    let angryArticles: [ArticleThumbnail] = [
        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 1", backgroundImage: UIImage(systemName: "sun.max.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 2", backgroundImage: UIImage(systemName: "car.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 3", backgroundImage: UIImage(systemName: "figure.walk")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 4", backgroundImage: UIImage(systemName: "bag.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 5", backgroundImage: UIImage(systemName: "phone.fill")!),
    ]
    
    override func loadView() {
        self.educationView = EducationView()
        view = educationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadArticles()
    }
    
    private func loadArticles() {
        educationView.todaysArticles.loadArticles(with: todaysArticles)
        educationView.sadArticles.loadArticles(with: sadArticles)
        educationView.angryArticles.loadArticles(with: angryArticles)
    }

}
