//
//  ArticleScrollView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/14/24.
//

import UIKit

class ArticleScrollView: UICollectionView {
    var articles: [UIView] = [] // TODO: custom Article type?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupView() {
//        setupScrollView()
//        setupArticles()
//    }
//    
//    func setupScrollView() {
//        scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(scrollView)
//    }
//    
//    func setupArticles() {
//        articles = []
//        for idx in 0..<10 {
//            let article = UILabel()
//            article.text = "Article \(idx + 1)"
//            article.font = .preferredFont(forTextStyle: .headline)
//            article.numberOfLines = 0
//            articles.append(article)
//        }
//    }
}
