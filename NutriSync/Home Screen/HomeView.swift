//
//  FeedView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class HomeView: UIView {
    
    // COMPONENTS
    var scrollView: UIScrollView!
    var profileButton: UIButton!
    var welcomeLabel: UILabel!
    var factLabel: UILabel!
    var dailyProgressLabel: UILabel!
    var monthlyProgressLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .lightGray
        
        setupScrollView()
        setupProfileButton()
        setupWelcomeLabel()
        setupFactLabel()
        setupDailyProgressLabel()
        setupMonthlyProgressLabel()
        
        initConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Border
        scrollView.layer.cornerRadius = 20
        scrollView.layer.masksToBounds = true
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.red.cgColor
        
        self.addSubview(scrollView)
    }
    
    func setupProfileButton() {
        profileButton = UIButton(type: .custom)
        profileButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        profileButton.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addSubview(profileButton)
        
    }
    
    func setupWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome, Dana"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 36)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(welcomeLabel)
    }
    
    func setupFactLabel() {
        factLabel = UILabel()
        factLabel.text = "Your daily calorie intake is 2,000 calories"
        factLabel.font = UIFont.boldSystemFont(ofSize: 24)
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(factLabel)
    }
    
    func setupDailyProgressLabel() {
        dailyProgressLabel = UILabel()
        dailyProgressLabel.text = "Daily Progress: 1,000 calories"
        dailyProgressLabel.font = UIFont.boldSystemFont(ofSize: 24)
        dailyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(dailyProgressLabel)
    }
    
    func setupMonthlyProgressLabel() {
        monthlyProgressLabel = UILabel()
        monthlyProgressLabel.text = "Monthly Progress: 1,000 calories"
        monthlyProgressLabel.font = UIFont.boldSystemFont(ofSize: 24)
        monthlyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(monthlyProgressLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            factLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            dailyProgressLabel.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            dailyProgressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            monthlyProgressLabel.topAnchor.constraint(equalTo: dailyProgressLabel.bottomAnchor, constant: 20),
            monthlyProgressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            monthlyProgressLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
