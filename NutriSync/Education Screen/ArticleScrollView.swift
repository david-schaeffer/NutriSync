//
//  ArticleScrollView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/14/24.
//

import UIKit
import Contentful

class ArticleScrollView: UIView {
    var collectionView: UICollectionView!
    var compositionalLayout: UICollectionViewCompositionalLayout!
    var searchController: UISearchController!
    
    private var sections: [Section] = []
    
    weak var delegate: ArticleScrollViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupSearchController()
        setupCollectionView()
        
        initConstraints()
    }

    private func setupCollectionView() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [headerItem]
        compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: ArticleCell.identifier)
        collectionView.register(ArticleHeaderView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: ArticleHeaderView.identifier)
        addSubview(collectionView)
    }
    
    private func setupSearchController() {
        searchController = UISearchController()
        searchController.searchBar.placeholder = "Search articles"
        searchController.searchBar.searchBarStyle = .minimal
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func getArticles() -> [Article] {
        return sections.flatMap(\.items)
    }
    
    func loadArticles(with articles: [Article], sectionStyle: SectionStyle) {
        switch sectionStyle {
        case .single:
            self.sections = [Section(items: articles, header: "Suggested Articles")]
        case .byCategory:
            let categoryDictionary: [String: [Article]] = articles.reduce(into: [:]) { result, article in
                guard let categories = article.categories else { return }
                for category in categories {
                    result[category, default: []].append(article)
                }
            }
            
            var sections: [Section] = []
            
            for key in categoryDictionary.keys.sorted(by: { Article.categoryOrder[$0] ?? 0 < Article.categoryOrder[$1] ?? 0 }) {
                let categoryArticles = categoryDictionary[key]!
                let section = Section(items: categoryArticles, header: key)
                sections.append(section)
            }
            
            self.sections = sections
            
        }
        
        collectionView.reloadData()
    }
}

extension ArticleScrollView: UICollectionViewDataSource {
    /// Represents a section in the data source.
    struct Section {
        
        /// The items that comprise the section.
        let items: [Article]
        
        let header: String
    }
    
    /// Describes the ways that items can be distributed across sections.
    enum SectionStyle {

        /// Items are all found in one section.
        case single
        
        /// Items are distributed across multiple sections based on their category identifier(s).
        case byCategory
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let articleCell = collectionView.cellForItem(at: indexPath) as? ArticleCell else {
            fatalError("Unable to find ArticleCell")
        }
        
        delegate?.articleScrollView(self, didSelectArticle: articleCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        
        let article = sections[indexPath.section].items[indexPath.item]
        cell.configure(with: article)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArticleHeaderView.identifier, for: indexPath) as? ArticleHeaderView else {
            return ArticleHeaderView()
        }
        
        headerView.titleLabel.text = sections[indexPath.section].header
        
        return headerView
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
