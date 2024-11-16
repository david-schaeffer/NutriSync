//
//  EducationView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class EducationView: UIView {
    var scrollView: UIScrollView!
    var educationLabel: UILabel!
    var todayLabel: UILabel!
    var todaysArticles: ArticleScrollView!
    var sadLabel: UILabel!
    var sadArticles: ArticleScrollView!
    var angryLabel: UILabel!
    var angryArticles: ArticleScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupScrollView()
        setupEducationLabel()
        setupArticleScrollViews()
        
        initConstraints()
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    
    private func setupEducationLabel() {
        educationLabel = UILabel()
        educationLabel.translatesAutoresizingMaskIntoConstraints = false
        educationLabel.text = "Education"
        educationLabel.font = UIFont.boldSystemFont(ofSize: 32)
        educationLabel.textColor = .label
        scrollView.addSubview(educationLabel)
    }
    
    private func setupArticleScrollViews() {
        setupTodaysArticles()
        setupSadArticles()
        setupAngryArticles()
    }
    
    private func setupTodaysArticles() {
        todayLabel = UILabel()
        todayLabel.text = "Today's Articles"
        todayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(todayLabel)
        
        todaysArticles = ArticleScrollView()
        todaysArticles.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(todaysArticles)
    }
    
    private func setupSadArticles() {
        sadLabel = UILabel()
        sadLabel.text = "Feeling Sad?"
        sadLabel.font = UIFont.boldSystemFont(ofSize: 18)
        sadLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(sadLabel)
        
        sadArticles = ArticleScrollView()
        sadArticles.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(sadArticles)
    }
    
    private func setupAngryArticles() {
        angryLabel = UILabel()
        angryLabel.text = "Feeling Angry?"
        angryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        angryLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(angryLabel)
        
        angryArticles = ArticleScrollView()
        angryArticles.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(angryArticles)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            educationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            educationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            todayLabel.topAnchor.constraint(equalTo: educationLabel.bottomAnchor, constant: 20),
            todayLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            todaysArticles.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 20),
            todaysArticles.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            todaysArticles.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            todaysArticles.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            todaysArticles.heightAnchor.constraint(equalToConstant: 200),
            
            sadLabel.topAnchor.constraint(equalTo: todaysArticles.bottomAnchor, constant: 20),
            sadLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            sadArticles.topAnchor.constraint(equalTo: sadLabel.bottomAnchor, constant: 20),
            sadArticles.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            sadArticles.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            sadArticles.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            sadArticles.heightAnchor.constraint(equalToConstant: 200),
            
            angryLabel.topAnchor.constraint(equalTo: sadArticles.bottomAnchor, constant: 20),
            angryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            angryArticles.topAnchor.constraint(equalTo: angryLabel.bottomAnchor, constant: 20),
            angryArticles.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            angryArticles.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            angryArticles.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            angryArticles.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            angryArticles.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
