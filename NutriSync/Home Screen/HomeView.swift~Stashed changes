//
//  FeedView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class HomeView: UIView {
    
    // COMPONENTS
    var profileButton: UIButton!
    var welcomeLabel: UILabel!
    var factLabel: UILabel!
    var dailyProgressLabel: UILabel!
    var monthlyProgressLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupProfileButton()
        setupWelcomeLabel()
        setupFactLabel()
        setupDailyProgressLabel()
        setupMonthlyProgressLabel()
    }
    
    func setupProfileButton() {
        profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileButton)
    }
    
    func setupWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome, Dana"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(welcomeLabel)
    }
    
    func setupFactLabel() {
        factLabel = UILabel()
        factLabel.text = "Your daily calorie intake is 2,000 calories"
        factLabel.font = UIFont.boldSystemFont(ofSize: 24)
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(factLabel)
    }
    
    func setupDailyProgressLabel() {
        dailyProgressLabel = UILabel()
        dailyProgressLabel.text = "Daily Progress: 1,000 calories"
        dailyProgressLabel.font = UIFont.boldSystemFont(ofSize: 24)
        dailyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dailyProgressLabel)
    }
    
    func setupMonthlyProgressLabel() {
        monthlyProgressLabel = UILabel()
        monthlyProgressLabel.text = "Monthly Progress: 1,000 calories"
        monthlyProgressLabel.font = UIFont.boldSystemFont(ofSize: 24)
        monthlyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(monthlyProgressLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: topAnchor),
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            factLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            factLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            factLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dailyProgressLabel.topAnchor.constraint(equalTo: factLabel.bottomAnchor),
            dailyProgressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            monthlyProgressLabel.topAnchor.constraint(equalTo: dailyProgressLabel.bottomAnchor),
            monthlyProgressLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthlyProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
