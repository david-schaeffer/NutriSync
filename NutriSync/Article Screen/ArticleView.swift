//
//  ArticleView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class ArticleView: UIView {
    var context: [CodingUserInfoKey : Any] = [:]

    var articleTitleLabel: UILabel!
    var articleScrollView: UIScrollView!
    var articleIllustration: UIImageView!
    var articleContentContainer: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .white
        
        setupArticleScrollView()
        setupArticleIllustration()
        setupArticleTitle()
        setupArticleContentContainer()
        
        initConstraints()
    }
    
    func setupArticleScrollView() {
        articleScrollView = UIScrollView()
        articleScrollView.showsVerticalScrollIndicator = false
        articleScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleScrollView)
    }
    
    func setupArticleTitle() {
        articleTitleLabel = UILabel()
        articleTitleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        articleTitleLabel.numberOfLines = 0
        articleTitleLabel.text = ""
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        articleScrollView.addSubview(articleTitleLabel)
    }
    
    func setupArticleIllustration() {
        articleIllustration = UIImageView()
        articleIllustration.layer.cornerRadius = 12
        articleIllustration.layer.masksToBounds = true
//        articleIllustration.backgroundColor = UIColor.secondarySystemBackground
        articleIllustration.contentMode = .scaleAspectFill // Maintain aspect ratio
        articleIllustration.translatesAutoresizingMaskIntoConstraints = false
        
        articleScrollView.addSubview(articleIllustration)
    }
    
    func setupArticleContentContainer() {
        articleContentContainer = UIStackView()
        articleContentContainer.backgroundColor = .white
        articleContentContainer.axis = .vertical
        articleContentContainer.distribution = .equalSpacing
        articleContentContainer.spacing = 20
        articleContentContainer.translatesAutoresizingMaskIntoConstraints = false
        
        articleScrollView.addSubview(articleContentContainer)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            articleScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            articleScrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            articleScrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            articleScrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            articleIllustration.topAnchor.constraint(equalTo: articleScrollView.topAnchor),
            articleIllustration.heightAnchor.constraint(equalToConstant: 160),
            articleIllustration.widthAnchor.constraint(equalTo: articleScrollView.widthAnchor),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleIllustration.bottomAnchor, constant: 20),
            articleTitleLabel.leadingAnchor.constraint(equalTo: articleScrollView.leadingAnchor, constant: 20),
            articleTitleLabel.widthAnchor.constraint(equalTo: articleScrollView.widthAnchor, constant: -40),
            
            articleContentContainer.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 10),
            articleContentContainer.leadingAnchor.constraint(equalTo: articleScrollView.leadingAnchor, constant: 20),
            articleContentContainer.widthAnchor.constraint(equalTo: articleScrollView.widthAnchor, constant: -40),
            articleContentContainer.bottomAnchor.constraint(equalTo: articleScrollView.bottomAnchor, constant: -20)
        ])
    }
}
