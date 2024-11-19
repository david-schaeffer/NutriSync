//
//  EducationViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
import Contentful

class EducationViewController: UIViewController {
    var educationView: EducationView!
    var client: Client!
    
//    let todaysArticles: [ArticleThumbnail] = [
//        ArticleThumbnail(id: UUID().uuidString, title: "Article 1 with a long title to see what happens", backgroundImage: UIImage(systemName: "heart.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Article 2", backgroundImage: UIImage(systemName: "person.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Article 3", backgroundImage: UIImage(systemName: "book.fill")!),
//    ]
//    
//    let sadArticles: [ArticleThumbnail] = [
//        ArticleThumbnail(id: UUID().uuidString, title: "Don't Worry, Be Happy", backgroundImage: UIImage(systemName: "face.smiling")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "The Mind-Gut Connection", backgroundImage: UIImage(systemName: "carrot.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Happy Foods", backgroundImage: UIImage(systemName: "birthday.cake.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Fourth Article", backgroundImage: UIImage(systemName: "4.circle.fill")!),
//    ]
//    
//    let angryArticles: [ArticleThumbnail] = [
//        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 1", backgroundImage: UIImage(systemName: "sun.max.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 2", backgroundImage: UIImage(systemName: "car.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 3", backgroundImage: UIImage(systemName: "figure.walk")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 4", backgroundImage: UIImage(systemName: "bag.fill")!),
//        ArticleThumbnail(id: UUID().uuidString, title: "Angry Article 5", backgroundImage: UIImage(systemName: "phone.fill")!),
//    ]
    
    override func loadView() {
        self.educationView = EducationView()
        view = educationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let contentfulSpaceId = Bundle.main.infoDictionary?["CONTENTFUL_SPACE_ID"] as? String else {
            fatalError("Missing CONTENTFUL_SPACE_ID in Info.plist")
        }
        guard let contentfulAccessToken = Bundle.main.infoDictionary?["CONTENTFUL_ACCESS_TOKEN"] as? String else {
            fatalError("Missing CONTENTFUL_ACCESS_TOKEN in Info.plist")
        }
        
        client = Client(spaceId: contentfulSpaceId,
                        environmentId: "master", // Defaults to "master" if omitted
                        accessToken: contentfulAccessToken,
                        contentTypeClasses: [Article.self])
        
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
    
    private func loadArticles(completion: @escaping ([Article]?) -> Void) {
        // TODO: Add loading animation during load
        DispatchQueue.global(qos: .userInitiated).async {
            self.client.fetchArray(of: Article.self) { (result: Result<HomogeneousArrayResponse<Article>, Error>) in
                switch result {
                case .success(let articlesResponse):
                    let featuredArticles = articlesResponse.items
                    print(featuredArticles)
                    DispatchQueue.main.async {
                        completion(featuredArticles)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
//        educationView.sadArticles.loadArticles(with: sadArticles)
//        educationView.angryArticles.loadArticles(with: angryArticles)
    }

}
