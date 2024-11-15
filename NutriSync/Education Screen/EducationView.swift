//
//  EducationView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class EducationView: UIView {
    var scrollView: UIScrollView!
    var articleScrollView: ArticleScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupScrollView()
        setupArticleScrollView()
        
        initConstraints()
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
    }
    
    private func setupArticleScrollView() {
        articleScrollView = ArticleScrollView()
        articleScrollView.backgroundColor = .red
        articleScrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(articleScrollView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            articleScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
//            articleScrollView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            articleScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            articleScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            articleScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            articleScrollView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
