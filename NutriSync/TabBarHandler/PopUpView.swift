//
//  PopUpView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/12/24.
//

import UIKit

class PopUpView: UIView {
    // COMPONENTS
    var logMoodButton: UIButton!
    var logMealButton: UIButton!
    var logEventButton: UIButton!
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .clear
        
        setupMoodButton()
        setupMealButton()
        setupEventButton()
        
        initConstraints()
    }
    
    func setupMoodButton() {
        var moodConfiguration = UIButton.Configuration.filled()
        moodConfiguration.cornerStyle = .capsule
        moodConfiguration.baseBackgroundColor = UIColor.systemBackground
        moodConfiguration.baseForegroundColor = UIColor.black
        moodConfiguration.image = UIImage(systemName: "face.smiling")
        moodConfiguration.imagePlacement = .top
        moodConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
        moodConfiguration.imagePadding = 6.0
        moodConfiguration.subtitle = "Mood"
        moodConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
        
        logMoodButton = UIButton(configuration: moodConfiguration)
        logMoodButton.layer.masksToBounds = false
        logMoodButton.layer.shadowRadius = 3
        logMoodButton.layer.shadowOpacity = 0.5
        logMoodButton.layer.shadowOffset = .zero
        logMoodButton.layer.shadowColor = UIColor.black.cgColor
        logMoodButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logMoodButton)
    }
    
    func setupMealButton() {
        var mealConfiguration = UIButton.Configuration.filled()
        mealConfiguration.cornerStyle = .capsule
        mealConfiguration.baseBackgroundColor = UIColor.systemBackground
        mealConfiguration.baseForegroundColor = UIColor.black
        mealConfiguration.image = UIImage(systemName: "carrot")
        mealConfiguration.imagePlacement = .top
        mealConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
        mealConfiguration.imagePadding = 6.0
        mealConfiguration.subtitle = "Meal"
        mealConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
        
        logMealButton = UIButton(configuration: mealConfiguration)
        logMealButton.layer.masksToBounds = false
        logMealButton.layer.shadowRadius = 3
        logMealButton.layer.shadowOpacity = 0.5
        logMealButton.layer.shadowOffset = .zero
        logMealButton.layer.shadowColor = UIColor.black.cgColor
        logMealButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logMealButton)
    }
    
    func setupEventButton() {
        var eventConfiguration = UIButton.Configuration.filled()
        eventConfiguration.cornerStyle = .capsule
        eventConfiguration.baseBackgroundColor = UIColor.systemBackground
        eventConfiguration.baseForegroundColor = UIColor.black
        eventConfiguration.image = UIImage(systemName: "calendar.badge.plus")
        eventConfiguration.imagePlacement = .top
        eventConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
        eventConfiguration.imagePadding = 6.0
        eventConfiguration.subtitle = "Event"
        eventConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
        
        logEventButton = UIButton(configuration: eventConfiguration)
        logEventButton.layer.masksToBounds = false
        logEventButton.layer.shadowRadius = 3
        logEventButton.layer.shadowOpacity = 0.5
        logEventButton.layer.shadowOffset = .zero
        logEventButton.layer.shadowColor = UIColor.black.cgColor
        logEventButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logEventButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: logMealButton.heightAnchor, multiplier: 2.0),
            
            logMoodButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            logMoodButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            logMealButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logMealButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            logEventButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
            logEventButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        guard let location = touch?.location(in: self) else { return }
//        if !self.frame.contains(location) {
//            print("Tapped outside the view")
//        } else {
//            print("Tapped inside the view")
//        }
//    }
}
