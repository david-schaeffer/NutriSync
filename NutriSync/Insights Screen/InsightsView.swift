//
//  InsightsView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class InsightsView: UIView {
    
    // COMPONENTS
    var scrollView: UIScrollView!
    var insightsLabel: UILabel!
    var dataAnalysisLabel: UILabel!
    var comparisonLabel: UILabel!
    var comparisonImage: UIImageView!
    var moodLabel: UILabel!
    var moodImage: UIImageView!
    var stressLabel: UILabel!
    var stressImage: UIImageView!
    var suggestedArticles: ArticleScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .white
        
        setupScrollView()
        setupInsightsLabel()
        setupComparisonLabel()
        setupMoodLabel()
        setupStressLabel()
        setupSuggestedArticles()
        
        // Load the images, with a fallback system image to help debug
        comparisonImage.image = UIImage(named: "combination1") ?? UIImage(systemName: "exclamationmark.triangle")
        moodImage.image = UIImage(named: "Moodchart1") ?? UIImage(systemName: "exclamationmark.triangle")
        stressImage.image = UIImage(named: "Stress") ?? UIImage(systemName: "exclamationmark.triangle")

        // Optional background colors to help debug
        comparisonImage.backgroundColor = .white
        moodImage.backgroundColor = .white
        stressImage.backgroundColor = .white
        
        initConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    
    func setupInsightsLabel() {
        insightsLabel = UILabel()
        insightsLabel.text = "Insights"
        insightsLabel.font = UIFont.boldSystemFont(ofSize: 32)
        insightsLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(insightsLabel)
        
        dataAnalysisLabel = UILabel()
        dataAnalysisLabel.text = "Data Analysis Based on the Last 7 Days"
        dataAnalysisLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dataAnalysisLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(dataAnalysisLabel)
    }
    
    func setupComparisonLabel() {
        comparisonLabel = UILabel()
        comparisonLabel.text = "Food vs Stress Levels Graph"
        comparisonLabel.font = UIFont.boldSystemFont(ofSize: 18)
        comparisonLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(comparisonLabel)
        
        comparisonImage = UIImageView()
        comparisonImage.layer.cornerRadius = 12
        comparisonImage.layer.masksToBounds = true // Ensures corners are rounded
        comparisonImage.backgroundColor = UIColor.secondarySystemBackground
        comparisonImage.contentMode = .scaleAspectFit // Maintain aspect ratio
        comparisonImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(comparisonImage)
    }

    func setupMoodLabel() {
        moodLabel = UILabel()
        moodLabel.text = "Mood breakdown over the last 7 days"
        moodLabel.font = UIFont.boldSystemFont(ofSize: 18)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(moodLabel)
        
        moodImage = UIImageView()
        moodImage.layer.cornerRadius = 12
        moodImage.layer.masksToBounds = true
        moodImage.backgroundColor = UIColor.secondarySystemBackground
        moodImage.contentMode = .scaleAspectFit // Maintain aspect ratio
        moodImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(moodImage)
    }

    func setupStressLabel() {
        stressLabel = UILabel()
        stressLabel.text = "Stress Trends over the last 7 days"
        stressLabel.font = UIFont.boldSystemFont(ofSize: 18)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stressLabel)
        
        stressImage = UIImageView()
        stressImage.layer.cornerRadius = 12
        stressImage.layer.masksToBounds = true
        stressImage.backgroundColor = UIColor.secondarySystemBackground
        stressImage.contentMode = .scaleAspectFit // Maintain aspect ratio
        stressImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stressImage)
    }
    
    func setupSuggestedArticles() {
        suggestedArticles = ArticleScrollView()
        suggestedArticles.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(suggestedArticles)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView Constraints
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            // Insights Label Constraints
            insightsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            insightsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            // Data Analysis Label Constraints
            dataAnalysisLabel.topAnchor.constraint(equalTo: insightsLabel.bottomAnchor, constant: 10),
            dataAnalysisLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            // Comparison Label Constraints
            comparisonLabel.topAnchor.constraint(equalTo: dataAnalysisLabel.bottomAnchor, constant: 30),
            comparisonLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            // Comparison Image Constraints (fit to screen width)
            comparisonImage.topAnchor.constraint(equalTo: comparisonLabel.bottomAnchor, constant: 10),
            comparisonImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            comparisonImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            comparisonImage.heightAnchor.constraint(equalToConstant: 150),
            
            // Mood Label Constraints
            moodLabel.topAnchor.constraint(equalTo: comparisonImage.bottomAnchor, constant: 30),
            moodLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            // Mood Image Constraints (fit to screen width)
            moodImage.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 10),
            moodImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            moodImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            moodImage.heightAnchor.constraint(equalToConstant: 120),
            
            // Stress Label Constraints
            stressLabel.topAnchor.constraint(equalTo: moodImage.bottomAnchor, constant: 30),
            stressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            // Stress Image Constraints (fit to screen width)
            stressImage.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 10),
            stressImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stressImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stressImage.heightAnchor.constraint(equalToConstant: 120),
            
            suggestedArticles.topAnchor.constraint(equalTo: stressImage.bottomAnchor, constant: 20),
            suggestedArticles.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            suggestedArticles.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            suggestedArticles.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            suggestedArticles.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            suggestedArticles.heightAnchor.constraint(greaterThanOrEqualToConstant: 300)
        ])
    }
}
