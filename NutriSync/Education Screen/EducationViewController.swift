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
    private var allArticles: [Article] = []
    
    override func loadView() {
        self.educationView = EducationView()
        view = educationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationView.articleView.delegate = self
        educationView.articleView.searchController.searchResultsUpdater = self
        navigationItem.searchController = educationView.articleView.searchController
        navigationItem.title = "Education"
        
        loadArticles { [weak self] articles in
            guard let self = self, let articles = articles else { return }
            
            self.allArticles = articles
            self.educationView.articleView.loadArticles(with: articles, sectionStyle: .byCategory)
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

extension EducationViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        if searchText.isEmpty {
            self.educationView.articleView.loadArticles(with: allArticles, sectionStyle: .byCategory)
            return
        }
        
        var matchingArticles: [Article] = []
        allArticles.forEach { article in
            if article.title!.contains(searchText) {
                matchingArticles.append(article)
            }
        }
        
        DispatchQueue.main.async {
            self.educationView.articleView.loadArticles(with: matchingArticles, sectionStyle: .byCategory)
        }
    }
}
