//
//  InsightsViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
        
class InsightsViewController: UIViewController {
    
    var insightsView: InsightsView!
    
    let suggestedArticles: [Article] = []
    
    override func loadView() {
        self.insightsView = InsightsView()
        view = insightsView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadArticles()
    }
    
    private func loadArticles() {
//        insightsView.suggestedArticles.loadArticles(with: suggestedArticles)
    }

}
