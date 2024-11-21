//
//  EducationView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class EducationView: UIView {
    var educationLabel: UILabel!
    var todayLabel: UILabel!
    var articleView: ArticleScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupEducationLabel()
        setupArticleView()
        
        initConstraints()
    }
    
    private func setupEducationLabel() {
        educationLabel = UILabel()
        educationLabel.translatesAutoresizingMaskIntoConstraints = false
        educationLabel.text = "Education"
        educationLabel.font = UIFont.boldSystemFont(ofSize: 32)
        educationLabel.textColor = .label
//        self.addSubview(educationLabel)
    }
    
    private func setupArticleView() {
        articleView = ArticleScrollView()
        articleView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
//            educationLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            educationLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            articleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            articleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            articleView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            articleView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -40),
            articleView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
