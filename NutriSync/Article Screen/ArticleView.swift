//
//  ArticleView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class ArticleView: UIView {

    var articleTitleLabel: UILabel!
    var articleScrollView: UIScrollView!
    var articleDescriptionLabel: UITextView!
    var articleIllustration: UIImageView!
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .white
        
        setupArticleTitle()
        setupArticleScrollView()
        setupArticleDescription()
        setupArticleIllustration()
        
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
        articleTitleLabel.text = "Mind-Gut Relationship"
        articleTitleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleTitleLabel)
    }
    
    func setupArticleDescription() {
        articleDescriptionLabel = UITextView()
        articleDescriptionLabel.text = "The relationship between the mind and gut has become a hot topic in health and wellness. Often referred to as the gut-brain axis, this bidirectional communication system connects the central nervous system (the brain) and the enteric nervous system (the gut). Emerging research reveals that this connection has profound effects on both mental and physical health. The Science Behind the Gut-Brain Axis: The gut is often called the second brain due to the vast network of neurons lining the gastrointestinal system. This complex system is capable of sending and receiving signals to and from the brain via the vagus nerve and other biochemical pathways. Key players in this communication include neurotransmitters like serotonin (95% of which is produced in the gut) and gut microbiota, the diverse community of bacteria residing in the digestive tract. How Gut Health Affects Mental Health: Studies have shown that an imbalance in gut bacteria, known as dysbiosis, may contribute to mental health issues such as anxiety, depression, and stress. A healthy gut microbiome helps regulate inflammation and produces short-chain fatty acids (SCFAs) that play a role in mood stabilization. Researchers are also exploring the role of the gut in disorders like autism and Alzheimer’s disease, suggesting that the gut-brain axis could unlock new avenues for treatment. The Impact of Mental Health on Gut Function: Just as the gut can influence the brain, the brain can also impact gut function. Chronic stress and anxiety can lead to gastrointestinal issues such as irritable bowel syndrome (IBS). Stress hormones like cortisol disrupt normal gut motility and reduce the gut's ability to absorb nutrients, creating a vicious cycle of poor gut health and increased mental stress."
        articleDescriptionLabel.layer.masksToBounds = false
        articleDescriptionLabel.backgroundColor = UIColor.secondarySystemBackground
        articleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        articleScrollView.addSubview(articleDescriptionLabel)
        
        
    }
    
    func setupArticleIllustration() {
        articleIllustration = UIImageView()
        articleIllustration.layer.cornerRadius = 12
        articleIllustration.layer.masksToBounds = true
        articleIllustration.backgroundColor = UIColor.secondarySystemBackground
        articleIllustration.contentMode = .scaleAspectFit // Maintain aspect ratio
        articleIllustration.translatesAutoresizingMaskIntoConstraints = false
        articleScrollView.addSubview(articleIllustration)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            articleScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            articleScrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            articleScrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            articleScrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            articleTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            articleTitleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            articleIllustration.topAnchor.constraint(equalTo: articleScrollView.topAnchor, constant: 16),
            articleIllustration.heightAnchor.constraint(greaterThanOrEqualToConstant: 75),
            
            articleDescriptionLabel.topAnchor.constraint(equalTo: articleIllustration.bottomAnchor, constant: 16),
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: articleScrollView.leadingAnchor),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: articleScrollView.trailingAnchor)
        ])
    }

    
    

}
