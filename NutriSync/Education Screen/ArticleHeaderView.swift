//
//  ArticleHeaderView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/19/24.
//

import UIKit

class ArticleHeaderView: UICollectionReusableView {
    static let identifier: String = "ArticleHeaderView"
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupTitleLabel()
        
        initConstraints()
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
//            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20)
        ])
    }
}
