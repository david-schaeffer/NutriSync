//
//  ArticleScrollView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/14/24.
//

import UIKit

class ArticleScrollView: UIView {
    var collectionView: UICollectionView!
    var flowLayout: UICollectionViewFlowLayout!
    var articles: [ArticleThumbnail] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupCollectionView()
        
        initConstraints()
    }

    private func setupCollectionView() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: ArticleCell.identifier)
        addSubview(collectionView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func loadArticles(with articles: [ArticleThumbnail]) {
        self.articles = articles
        collectionView.reloadData()
    }
}

extension ArticleScrollView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: articles[indexPath.item])
        cell.tag = indexPath.item
        return cell
    }
}

extension ArticleScrollView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.bounds.height
        let cellWidth = cellHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
