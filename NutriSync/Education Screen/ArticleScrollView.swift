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
//    var compositionalLayout: UICollectionViewCompositionalLayout!
    private var articles: [Article] = []
    
    weak var delegate: ArticleScrollViewDelegate?
    
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
        
//        let inset: CGFloat = 5
//        
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//        compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        
//        compositionalLayout = UICollectionViewCompositionalLayout(sectionProvider: <#T##UICollectionViewCompositionalLayoutSectionProvider##UICollectionViewCompositionalLayoutSectionProvider##(Int, any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?#>)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: ArticleCell.identifier)
//        collectionView.register(ArticleHeaderView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: ArticleHeaderView.identifier)
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
    
    func loadArticles(with articles: [Article]) {
        self.articles = articles
        collectionView.reloadData()
    }
}

extension ArticleScrollView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ArticleHeaderView", for: indexPath) as? ArticleHeaderView else {
//            return ArticleHeaderView()
//        }
//        
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let articleCell = collectionView.cellForItem(at: indexPath) as? ArticleCell else {
            fatalError("Unable to find ArticleCell")
        }
//        guard let articleId = articleCell?.articleId else { return }
        delegate?.articleScrollView(self, didSelectArticle: articleCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: articles[indexPath.item])
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

protocol ArticleScrollViewDelegate: AnyObject {
    func articleScrollView(_ scrollView: ArticleScrollView, didSelectArticle article: ArticleCell)
}
