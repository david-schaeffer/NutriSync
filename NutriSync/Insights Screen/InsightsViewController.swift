//
//  InsightsViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
        
class InsightsViewController: UIViewController {
    
    var insightsView: InsightsView!
    
    let suggestedArticles: [ArticleThumbnail] = [
        ArticleThumbnail(id: UUID().uuidString, title: "Article 1 with a long title to see what happens", backgroundImage: UIImage(systemName: "heart.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Article 2", backgroundImage: UIImage(systemName: "person.fill")!),
        ArticleThumbnail(id: UUID().uuidString, title: "Article 3", backgroundImage: UIImage(systemName: "book.fill")!),
    ]
    
    override func loadView() {
        self.insightsView = InsightsView()
        view = insightsView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadArticles()
    }
    
    private func loadArticles() {
        insightsView.suggestedArticles.loadArticles(with: suggestedArticles)
    }

}
