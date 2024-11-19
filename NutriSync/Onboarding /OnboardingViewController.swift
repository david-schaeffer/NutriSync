//
//  OnboardingViewController.swift
//  NutriSync
//
//  Created by Simone Ritcheson on 11/19/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    // Onboarding pages with detailed content
    struct OnboardingPage {
        let title: String
        let content: String
        let image: UIImage?
    }
    
    private let pages: [OnboardingPage] = [
        .init(
            title: "Welcome to NutriSync",
            content: """
            **Hi! Welcome to NutriSync!**

            We're thrilled to have you on board. NutriSync is your holistic health companion, designed to help you seamlessly track and manage your nutrition, stress, and overall well-being.

            With NutriSync, you can:
            • **Log Meals:** Record what you eat to gain insights into your nutritional habits.
            • **Track Moods:** Note how you're feeling throughout the day to identify patterns and triggers.
            • **Log Events:** Keep tabs on impactful moments like exams, parties, or other life events that influence your stress or mood.

            Navigate with ease using the **Navigation Bar**, which provides quick access to:
            • **Education:** Learn tips and insights for better health management.
            • **Insights:** Discover personalized trends and data-driven recommendations.
            • **Calendar:** Visualize your logs and events in a clear, organized timeline.
            • **Home:** Your dashboard for an at-a-glance view of your progress.
            • **Log:** The place to add your meals, moods, or events effortlessly.

            Your journey to better health starts here! Dive in, explore the features, and enjoy the insights NutriSync brings to your life.

            Let's make healthier living simpler, together.
            """,
            image: UIImage(named: "onboarding_welcome")
        )
    ]
    
    // UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupGetStartedButton()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func setupGetStartedButton() {
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 200),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func getStartedTapped() {
        // Navigate to main app screen or dismiss onboarding
        dismiss(animated: true, completion: nil)
    }
}

// Custom Cell for Onboarding
class OnboardingCell: UICollectionViewCell {
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 15
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textAlignment = .center
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(textView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configure(with page: OnboardingViewController.OnboardingPage) {
        imageView.image = page.image
        
        // Create attributed string with markdown-like formatting
        let attributedText = createAttributedText(from: page.content)
        textView.attributedText = attributedText
    }
    
    private func createAttributedText(from text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 5
        
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ]
        
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]
        
        let attributedString = NSMutableAttributedString(string: text, attributes: baseAttributes)
        
        // Apply bold formatting for text between **
        let boldRegex = try? NSRegularExpression(pattern: "\\*\\*(.*?)\\*\\*", options: [])
        let boldMatches = boldRegex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        boldMatches?.reversed().forEach { match in
            attributedString.addAttributes(boldAttributes, range: match.range(at: 1))
            attributedString.deleteCharacters(in: NSRange(location: match.range.location + match.range.length - 2, length: 2))
            attributedString.deleteCharacters(in: NSRange(location: match.range.location, length: 2))
        }
        
        return attributedString
    }
}

// UICollectionView Delegate and DataSource Extensions
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.configure(with: pages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
