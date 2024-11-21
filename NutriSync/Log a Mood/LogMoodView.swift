import UIKit

class LogMoodView: UIView {
    
    // COMPONENTS
    var logMoodLabel: UILabel!
    var moodLabel: UILabel!
    var moodScrollView: UIScrollView!
    var moodStackView: UIStackView!
    var stressLabel: UILabel!
    var stressSlider: UISlider!
    var minLabel: UILabel!
    var maxLabel: UILabel!
    var logButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupLogMoodLabel()
        setupMoodLabel()
        setupMoodScrollView()
        setupMoodStackView()
        setupStressLabel()
        setupStressSlider()
        setupMinLabel()
        setupMaxLabel()
        setupLogButton()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLogMoodLabel() {
        logMoodLabel = UILabel()
        logMoodLabel.text = "Log a Mood"
        logMoodLabel.font = .boldSystemFont(ofSize: 20)
        logMoodLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logMoodLabel)
    }
    
    func setupMoodLabel() {
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = .boldSystemFont(ofSize: 16)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moodLabel)
    }
    
    func setupMoodScrollView() {
        moodScrollView = UIScrollView()
        moodScrollView.showsHorizontalScrollIndicator = true
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
                config.baseForegroundColor = .black
                config.baseBackgroundColor = .white
                config.cornerStyle = .capsule
                
                config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                button.configuration = config
                
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.systemGray4.cgColor
                button.layer.cornerRadius = 20
                

                moodStackView.addArrangedSubview(button)
                
                // will need to add selection stuff here
//                button.addTarget(self, action: #selector(toggleButtonSelection(_:)), for: .touchUpInside)
            }
    }
    
    func setupStressLabel() {
        stressLabel = UILabel()
        stressLabel.text = "Stress"
        stressLabel.font = .boldSystemFont(ofSize: 16)
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
    
    func setupMinLabel() {
        minLabel = UILabel()
        minLabel.text = "0"
        minLabel.textColor = .secondaryLabel
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(minLabel)
    }
    
    func setupMaxLabel() {
        maxLabel = UILabel()
        maxLabel.text = "10"
        maxLabel.textColor = .secondaryLabel
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(maxLabel)
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
            logMoodLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logMoodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            moodLabel.topAnchor.constraint(equalTo: logMoodLabel.bottomAnchor, constant: 24),
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
            
            stressLabel.topAnchor.constraint(equalTo: moodScrollView.bottomAnchor, constant: 24),
            stressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            minLabel.leadingAnchor.constraint(equalTo: stressSlider.leadingAnchor),
            minLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),
            
            stressSlider.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 16),
            stressSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stressSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            maxLabel.trailingAnchor.constraint(equalTo: stressSlider.trailingAnchor),
            maxLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),
            
            logButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

    }
}

