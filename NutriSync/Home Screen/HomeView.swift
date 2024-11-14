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
    var welcomeLabel: UILabel!
    var factView: UIView!
    var factLabel: UILabel!
    var factText: UILabel!
    var dailyProgressView: UIView!
    var dailyProgressLabel: UILabel!
    var dailyProgressText: UILabel!
    var monthlyProgressView: UIView!
    var monthlyProgressLabel: UILabel!
    var monthlyProgressCalendar: UICalendarView!
    let calendarViewDelegate: CalendarViewDelegate = CalendarViewDelegate()
    
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
        
        setupScrollView()
        setupWelcomeLabel()
        setupFactLabel()
        setupDailyProgressLabel()
        setupMonthlyProgressLabel()
        
        initConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    
    func setupWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome, <User>!"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 36)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(welcomeLabel)
    }
    
    func setupFactLabel() {
        factView = UIView()
        factView.layer.cornerRadius = 12
        factView.layer.masksToBounds = false
        factView.backgroundColor = UIColor.secondarySystemBackground
        factView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(factView)
        
        factLabel = UILabel()
        factLabel.text = "Fact of the moment"
        factLabel.font = UIFont.boldSystemFont(ofSize: 18)
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        factView.addSubview(factLabel)
        
        factText = UILabel()
        factText.text = "An avocado has twice as much potassium as a banana!"
        factText.font = UIFont.systemFont(ofSize: 18)
        factText.textAlignment = .left
        factText.lineBreakMode = .byWordWrapping
        factText.numberOfLines = 0
        factText.translatesAutoresizingMaskIntoConstraints = false
        factView.addSubview(factText)
    }
    
    func setupDailyProgressLabel() {
        dailyProgressView = UIView()
        dailyProgressView.layer.cornerRadius = 12
        dailyProgressView.layer.masksToBounds = true
        dailyProgressView.backgroundColor = UIColor.secondarySystemBackground
        dailyProgressView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(dailyProgressView)
        
        dailyProgressLabel = UILabel()
        dailyProgressLabel.text = "Today"
        dailyProgressLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dailyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        dailyProgressView.addSubview(dailyProgressLabel)
        
        dailyProgressText = UILabel()
        dailyProgressText.text = "No logs today."
        dailyProgressText.font = UIFont.systemFont(ofSize: 18)
        dailyProgressText.textAlignment = .center
        dailyProgressText.translatesAutoresizingMaskIntoConstraints = false
        dailyProgressView.addSubview(dailyProgressText)
    }
    
    func setupMonthlyProgressLabel() {
        monthlyProgressView = UIView()
        monthlyProgressView.layer.cornerRadius = 12
        monthlyProgressView.layer.masksToBounds = true
        monthlyProgressView.backgroundColor = UIColor.secondarySystemBackground
        monthlyProgressView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(monthlyProgressView)
        
        monthlyProgressLabel = UILabel()
        monthlyProgressLabel.text = "This Month"
        monthlyProgressLabel.font = UIFont.boldSystemFont(ofSize: 18)
        monthlyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        monthlyProgressView.addSubview(monthlyProgressLabel)
        
        monthlyProgressCalendar = UICalendarView()
        monthlyProgressCalendar.delegate = calendarViewDelegate
        monthlyProgressCalendar.calendar = Calendar(identifier: .gregorian)
        monthlyProgressCalendar.locale = Locale(identifier: "en_US_POSIX")
        monthlyProgressCalendar.fontDesign = .rounded
        monthlyProgressCalendar.translatesAutoresizingMaskIntoConstraints = false
        monthlyProgressView.addSubview(monthlyProgressCalendar)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            factView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            factView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            factView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            factView.heightAnchor.constraint(equalTo: welcomeLabel.heightAnchor, multiplier: 3.0),
            
            factLabel.topAnchor.constraint(equalTo: factView.topAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: factView.leadingAnchor, constant: 20),
            factLabel.widthAnchor.constraint(equalTo: factView.widthAnchor, constant: -40),
            
            factText.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 10),
            factText.leadingAnchor.constraint(equalTo: factView.leadingAnchor, constant: 20),
            factText.widthAnchor.constraint(equalTo: factView.widthAnchor, constant: -40),
            
            dailyProgressView.topAnchor.constraint(equalTo: factView.bottomAnchor, constant: 20),
            dailyProgressView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            dailyProgressView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            dailyProgressView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            dailyProgressLabel.topAnchor.constraint(equalTo: dailyProgressView.topAnchor, constant: 20),
            dailyProgressLabel.leadingAnchor.constraint(equalTo: dailyProgressView.leadingAnchor, constant: 20),
            dailyProgressLabel.widthAnchor.constraint(equalTo: dailyProgressView.widthAnchor, constant: -40),
            
            dailyProgressText.topAnchor.constraint(equalTo: dailyProgressLabel.bottomAnchor, constant: 10),
            dailyProgressText.leadingAnchor.constraint(equalTo: dailyProgressView.leadingAnchor, constant: 20),
            dailyProgressText.widthAnchor.constraint(equalTo: dailyProgressView.widthAnchor, constant: -40),
            
            monthlyProgressView.topAnchor.constraint(equalTo: dailyProgressView.bottomAnchor, constant: 20),
            monthlyProgressView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            monthlyProgressView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            monthlyProgressView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            monthlyProgressView.heightAnchor.constraint(greaterThanOrEqualToConstant: 600),
            
            monthlyProgressLabel.topAnchor.constraint(equalTo: monthlyProgressView.topAnchor, constant: 20),
            monthlyProgressLabel.leadingAnchor.constraint(equalTo: monthlyProgressView.leadingAnchor, constant: 20),
            monthlyProgressLabel.widthAnchor.constraint(equalTo: monthlyProgressView.widthAnchor, constant: -40),
            
            monthlyProgressCalendar.topAnchor.constraint(equalTo: monthlyProgressLabel.bottomAnchor, constant: 10),
            monthlyProgressCalendar.leadingAnchor.constraint(equalTo: monthlyProgressView.leadingAnchor, constant: 20),
            monthlyProgressCalendar.widthAnchor.constraint(equalTo: monthlyProgressView.widthAnchor, constant: -40),
        ])
    }
}
