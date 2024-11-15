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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        articleView = UIImageView()
        articleView.contentMode = .scaleAspectFill
        articleView.backgroundColor = .lightGray
        articleView.clipsToBounds = true
        articleView.layer.cornerRadius = 20
        articleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleView)
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            articleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            articleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configure(with article: UIImage) {
        articleView.image = article
    }
}
