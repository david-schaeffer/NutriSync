//
//  LogMealView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogMealView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var mealTextField: UITextField!
    var eventTextField: UITextField!

    var moodLabel: UILabel!
    var stressLabel: UILabel!

    var moodStackView: UIStackView!
    var moodScrollView: UIScrollView!

    var stressSlider: UISlider!
    var stressMinLabel: UILabel!
    var stressMaxLabel: UILabel!
    
    var logButton: UIButton!


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupMealTextField()
        setupMoodLabel()
        setupMoodStackView()
        setupStressLabel()
        setupStressSlider()
        setupStressMinLabel()
        setupStressMaxLabel()
        setupEventTextField()
        setupLogButton()
        setupMoodScrollView()
        initConstraints()
    }
    
    
    func setupMealTextField(){
        mealTextField = UITextField()
        mealTextField.placeholder = "What did you eat?"
        mealTextField.textColor = .lightGray
        mealTextField.borderStyle = .roundedRect
        mealTextField.font = UIFont.systemFont(ofSize: 18)
        mealTextField.textColor = .black
        mealTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mealTextField)
    }
    func setupEventTextField(){
        eventTextField = UITextField()
        eventTextField.placeholder = "What event do you have coming up?"
        eventTextField.textColor = .lightGray
        eventTextField.borderStyle = .roundedRect
        eventTextField.font = UIFont.systemFont(ofSize: 18)
        eventTextField.textColor = .black
        eventTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(eventTextField)
    }
    
    func setupMoodLabel(){
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = UIFont.systemFont(ofSize: 24)
        moodLabel.textColor = .black
        moodLabel.textAlignment = .center
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(moodLabel)
    }
    
    func setupStressLabel(){
        stressLabel = UILabel()
        stressLabel.text = "Stress"
        stressLabel.font = UIFont.systemFont(ofSize: 24)
        stressLabel.textColor = .black
        stressLabel.textAlignment = .center
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stressLabel)
    }
    
   
    func setupMoodStackView() {
        moodStackView = UIStackView()
        moodStackView.axis = .horizontal
        moodStackView.spacing = 12
        moodStackView.translatesAutoresizingMaskIntoConstraints = false
        moodScrollView.addSubview(moodStackView)
        
        let moods = ["Anger", "Fear", "Sadness", "Disgust", "Content", "Enjoyment"]
        for mood in moods {
            let button = UIButton()
            button.setTitle(mood, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor
            moodStackView.addArrangedSubview(button)
        }
    }
    
    func setupMoodScrollView() {
        moodScrollView = UIScrollView()
        moodScrollView.showsHorizontalScrollIndicator = true
        moodScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moodScrollView)
    }
    
    func setupStressSlider() {
        stressSlider = UISlider()
        stressSlider.minimumValue = 1
        stressSlider.maximumValue = 10
        stressSlider.value = 1
        stressSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressSlider)
    }
    
    func setupStressMinLabel() {
        stressMinLabel = UILabel()
        stressMinLabel.text = "1"
        stressMinLabel.textColor = .secondaryLabel
        stressMinLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressMinLabel)
    }
    
    func setupStressMaxLabel() {
        stressMaxLabel = UILabel()
        stressMaxLabel.text = "10"
        stressMaxLabel.textColor = .secondaryLabel
        stressMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressMaxLabel)
    }
    
    func setupLogButton() {
        logButton = UIButton()
        logButton.setTitle("Log", for: .normal)
        logButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        logButton.backgroundColor = .black
        logButton.layer.cornerRadius = 25
        logButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            mealTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mealTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            
            
            moodLabel.topAnchor.constraint(equalTo: mealTextField.bottomAnchor, constant: 16),
            moodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
           // moodLabel.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 24),
           // moodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            
            moodScrollView.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 16),
            moodScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moodScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            moodScrollView.heightAnchor.constraint(equalToConstant: 44),
            
            
            moodStackView.topAnchor.constraint(equalTo: moodScrollView.topAnchor),
            moodStackView.leadingAnchor.constraint(equalTo: moodScrollView.leadingAnchor),
            moodStackView.trailingAnchor.constraint(equalTo: moodScrollView.trailingAnchor),
            moodStackView.bottomAnchor.constraint(equalTo: moodScrollView.bottomAnchor),
            moodStackView.heightAnchor.constraint(equalTo: moodScrollView.heightAnchor),
            
            stressLabel.topAnchor.constraint(equalTo: moodScrollView.bottomAnchor, constant: 24),
            stressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            stressMinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stressMinLabel.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 16),
            
            stressSlider.leadingAnchor.constraint(equalTo: stressMinLabel.trailingAnchor, constant: 8),
            stressSlider.centerYAnchor.constraint(equalTo: stressMinLabel.centerYAnchor),
            
            stressMaxLabel.leadingAnchor.constraint(equalTo: stressSlider.trailingAnchor, constant: 8),
            stressMaxLabel.centerYAnchor.constraint(equalTo: stressSlider.centerYAnchor),
            stressMaxLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            eventTextField.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 16),
            eventTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            logButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
           ])
    }
}
