//
//  EducationViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
import Contentful

class EducationViewController: UIViewController, ArticleScrollViewDelegate {
   
    private var educationView: EducationView!
    private let client = ContentfulClient()
    
    override func loadView() {
        self.educationView = EducationView()
        view = educationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationView.featuredArticles.delegate = self
        educationView.sadArticles.delegate = self
        educationView.angryArticles.delegate = self
        
        loadArticles { [weak self] articles in
            guard let self = self, let articles = articles else { return }
            let categoryDictionary: [String: [Article]] = articles.reduce(into: [:]) { result, article in
                guard let categories = article.categories else { return }
                for category in categories {
                    result[category, default: []].append(article)
                }
            }
            self.educationView.featuredArticles.loadArticles(with: categoryDictionary["Featured"] ?? [])
            self.educationView.sadArticles.loadArticles(with: categoryDictionary["Sad"] ?? [])
            self.educationView.angryArticles.loadArticles(with: categoryDictionary["Angry"] ?? [])
        }
    }
    
    func articleScrollView(_ scrollView: ArticleScrollView, didSelectArticle article: ArticleCell) {
        let articleVC = ArticleViewController(articleId: article.articleId)
        navigationController?.pushViewController(articleVC, animated: true)
    }
    
    private func loadArticles(completion: @escaping ([Article]?) -> Void) {
        // TODO: Add loading animation during load
        DispatchQueue.global(qos: .userInitiated).async {
            self.client.fetchArticles { (result: Result<HomogeneousArrayResponse<Article>, Error>) in
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

}
