//
//  LogMealView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogMealView: UIView {
    
    var logMealLabel: UILabel!
    var mealLabel: UILabel!
    var mealTextField: UITextField!

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
        setupLogMealLabel()
        setupMealLabel()
        setupMealTextField()
        setupMoodLabel()
        setupMoodScrollView()
        setupMoodStackView()
        setupStressLabel()
        setupStressSlider()
        setupStressMinLabel()
        setupStressMaxLabel()
        setupLogButton()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLogMealLabel() {
        logMealLabel = UILabel()
        logMealLabel.text = "Log a Meal"
        logMealLabel.font = .boldSystemFont(ofSize: 20)
        logMealLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logMealLabel)
    }
    
    func setupMealLabel() {
        mealLabel = UILabel()
        mealLabel.text = "Meal"
        mealLabel.font = UIFont.boldSystemFont(ofSize: 16)
        mealLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mealLabel)
    }

    func setupMealTextField() {
        mealTextField = UITextField()
        mealTextField.placeholder = "What did you eat?"
        mealTextField.textColor = .lightGray
        mealTextField.borderStyle = .roundedRect
        mealTextField.font = UIFont.systemFont(ofSize: 16)
        mealTextField.textColor = .black
        mealTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mealTextField)
    }
    
    func setupMoodLabel() {
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = UIFont.boldSystemFont(ofSize: 16)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moodLabel)
    }
    
    func setupMoodScrollView() {
        moodScrollView = UIScrollView()
        moodScrollView.showsHorizontalScrollIndicator = false
        moodScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moodScrollView)
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
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 16)
                
                var config = UIButton.Configuration.plain()
                config.title = mood
                config.baseBackgroundColor = .white
                config.cornerStyle = .capsule
                
                config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                button.configuration = config
                
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.systemGray4.cgColor
                button.layer.cornerRadius = 20

                moodStackView.addArrangedSubview(button)
            }
    }
    
    func setupStressLabel() {
        stressLabel = UILabel()
        stressLabel.text = "Stress"
        stressLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressLabel)
    }
    
    func setupStressSlider() {
        stressSlider = UISlider()
        stressSlider.minimumValue = 0
        stressSlider.maximumValue = 10
        stressSlider.value = 1
        stressSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressSlider)
    }
    
    func setupStressMinLabel() {
        stressMinLabel = UILabel()
        stressMinLabel.text = "0"
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
        logButton.backgroundColor = .accent
        logButton.layer.cornerRadius = 25
        logButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            logMealLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logMealLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            mealLabel.topAnchor.constraint(equalTo: logMealLabel.bottomAnchor, constant: 16),
            mealLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            mealTextField.topAnchor.constraint(equalTo: mealLabel.bottomAnchor, constant: 16),
            mealTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mealTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            moodLabel.topAnchor.constraint(equalTo: mealTextField.bottomAnchor, constant: 16),
            moodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            moodScrollView.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 16),
            moodScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moodScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            moodScrollView.heightAnchor.constraint(equalToConstant: 44),

            moodStackView.topAnchor.constraint(equalTo: moodScrollView.topAnchor),
            moodStackView.leadingAnchor.constraint(equalTo: moodScrollView.leadingAnchor),
            moodStackView.trailingAnchor.constraint(equalTo: moodScrollView.trailingAnchor),
            moodStackView.bottomAnchor.constraint(equalTo: moodScrollView.bottomAnchor),
            moodStackView.heightAnchor.constraint(equalTo: moodScrollView.heightAnchor),

            stressLabel.topAnchor.constraint(equalTo: moodScrollView.bottomAnchor, constant: 16),
            stressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            stressSlider.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 8),
            stressSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stressSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            stressMinLabel.leadingAnchor.constraint(equalTo: stressSlider.leadingAnchor),
            stressMinLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),

            stressMaxLabel.trailingAnchor.constraint(equalTo: stressSlider.trailingAnchor),
            stressMaxLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),
            
            logButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            logButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
