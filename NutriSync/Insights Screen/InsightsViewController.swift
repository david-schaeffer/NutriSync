//
//  InsightsViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
import Contentful
        
class InsightsViewController: UIViewController, ArticleScrollViewDelegate {
    
    var insightsView: InsightsView!
    
    let suggestedArticles: [Article] = [] 
    
    override func loadView() {
        self.insightsView = InsightsView()
        view = insightsView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        insightsView.suggestedArticles.delegate = self

        loadArticles { [weak self] articles in
            guard let self = self, let articles = articles else { return }
            self.insightsView.suggestedArticles.loadArticles(with: articles, sectionStyle: .single)
        }
    }
    
    private func loadArticles(completion: @escaping ([Article]?) -> Void) {
        let client = ContentfulClient()
        let query = QueryOn<Article>().where(field: .categories, .includes(["Featured"]))
        
        // TODO: Add loading animation during load
        
        DispatchQueue.global(qos: .userInitiated).async {
            client.fetchArticles(withQuery: query) { (result: Result<HomogeneousArrayResponse<Article>, Error>) in
                switch result {
                case .success(let articlesResponse):
                    DispatchQueue.main.async {
                        completion(articlesResponse.items)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func articleScrollView(_ scrollView: ArticleScrollView, didSelectArticle article: ArticleCell) {
        let articleVC = ArticleViewController(articleId: article.articleId)
        navigationController?.pushViewController(articleVC, animated: true)
    }
}
