//
//  ArticleViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
import Contentful

class ArticleViewController: UIViewController {

    private var articleView: ArticleView!
    private var articleId: String!
    private let client = ContentfulClient()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(articleId: String) {
        super.init(nibName: nil, bundle: nil)
        self.articleId = articleId
    }

    override func loadView() {
        self.articleView = ArticleView()
        view = articleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticle(articleId: self.articleId) { [weak self] article in
            guard let self = self, let article = article else { return }
            
            print(article)
            
            // Article title
            articleView.articleTitleLabel.text = article.title
            
            // Article image
            if let thumbnailUrl: URL = article.thumbnail?.url {
                URLSession.shared.dataTask(with: thumbnailUrl) { data, _, _ in
                    guard let imageData = data else { return }

                    DispatchQueue.main.async {
                        self.articleView.articleIllustration.image = UIImage(data: imageData)
                    }
                }.resume()
            } else {
                articleView.articleIllustration.image = UIImage(systemName: "exclamationmark.triangle") // TODO: replace with NutriSync icon
            }
            
            // Article content
            article.content?.content.forEach {
                self.renderNode($0)
//                print($0)
            }
        }
    }
    
    private func renderNode(_ node: Node) {
        switch node {
        case let paragraph as Paragraph:
            let label = UILabel()
            label.numberOfLines = 0
            label.text = paragraph.content.compactMap {
                if case let text as Text = $0 {
                    return text.value
                }
                return nil
            }.joined()
            
            self.articleView.articleContentContainer.addArrangedSubview(label)
        case let heading as Heading:
            let label = UILabel()
            label.numberOfLines = 0
            label.text = heading.content.compactMap {
                if case let text as Text = $0 {
                    return text.value
                }
                return nil
            }.joined()
            label.font = UIFont.boldSystemFont(ofSize: 40 - (CGFloat(heading.level) * 4))
            
            self.articleView.articleContentContainer.addArrangedSubview(label)
        case let unorderedList as UnorderedList:
            let label = UILabel()
            label.numberOfLines = 0
            label.text = unorderedList.content.compactMap {
                if case let listItem as ListItem = $0 {
                    return "• " + listItem.content.compactMap {
                        if case let paragraph as Paragraph = $0 {
                            return paragraph.content.compactMap {
                                if case let text as Text = $0 {
                                    return text.value
                                }
                                return nil
                            }.joined()
                        }
                        return nil
                    }.joined()
                }
                return nil
            }.joined(separator: "\n")
            
            self.articleView.articleContentContainer.addArrangedSubview(label)
        default:
            return
        }
    }
    
    private func fetchArticle(articleId: String, completion: @escaping (Article?) -> Void) {
       DispatchQueue.global(qos: .userInitiated).async {
           self.client.fetchArticle(withId: articleId, completion: { result in
               switch result {
               case .success(let articleResponse):
                   DispatchQueue.main.async {
                       completion(articleResponse)
                   }
               case .failure(let error):
                   print(error)
               }
           })
       }
   }


}
