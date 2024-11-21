//
//  ArticleCell.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/15/24.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    static let identifier: String = "ArticleCell"
    
    var articleView: UIImageView!
    var articleTitle: UILabel!
    var gradientLayer: CAGradientLayer!
    var articleId: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGradientLayer()
        setupArticleView()
        setupArticleTitle()
        
        initConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = CGRect(
            x: 0,
            y: bounds.height / 2,
            width: bounds.width,
            height: bounds.height / 2
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.6).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
    }
    
    private func setupArticleView() {
        articleView = UIImageView()
        articleView.contentMode = .scaleAspectFill
        articleView.backgroundColor = .secondarySystemBackground
        articleView.clipsToBounds = true
        articleView.layer.cornerRadius = 10
        articleView.layer.addSublayer(gradientLayer)
        
        articleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleView)
    }
    
    private func setupArticleTitle() {
        articleTitle = UILabel()
        articleTitle.font = .boldSystemFont(ofSize: 16)
        articleTitle.textColor = .white
        articleTitle.numberOfLines = 2
        articleTitle.lineBreakMode = .byTruncatingTail
        articleTitle.clipsToBounds = true
        
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleTitle)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            articleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            articleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            articleTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            articleTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            articleTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(with article: Article) {
        if let thumbnailUrl: URL = article.thumbnail?.url {
            URLSession.shared.dataTask(with: thumbnailUrl) { data, _, _ in
                guard let imageData = data else { return }
                
                DispatchQueue.main.async {
                    self.articleView.image = UIImage(data: imageData)
                }
            }.resume()
        } else {
            articleView.image = UIImage(systemName: "exclamationmark.triangle") // TODO: replace with NutriSync icon
        }
        
//        articleView.image = article.backgroundImg?.urlString
        articleTitle.text = article.title
        articleId = article.id
    }
}
