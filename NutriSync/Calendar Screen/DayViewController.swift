import UIKit

class DayViewController: UIViewController {
    
    // UI Components
    var dateLabel: UILabel!
    var logLabel: UILabel!
    var logTextBox: UITextView!
    var moodLabel: UILabel!
    var stressLabel: UILabel!
    var stressSlider: UISlider!
    var minLabel: UILabel!
    var maxLabel: UILabel!
    
    var moodStack: UIStackView!
    
    var selectedDate: Date?
    var moodOptions = ["Happy", "Sad", "Excited"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateDateLabel()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        
        dateLabel = UILabel()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        dateLabel.textAlignment = .center
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        logLabel = UILabel()
        logLabel.text = "Log"
        logLabel.font = UIFont.systemFont(ofSize: 16)
        logLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logLabel)
        
        logTextBox = UITextView()
        logTextBox.text = "Today, I ate oatmeal with frozen berries for brunch."
        logTextBox.font = UIFont.systemFont(ofSize: 16)
        logTextBox.isEditable = false
        logTextBox.isScrollEnabled = true
        logTextBox.layer.borderColor = UIColor.lightGray.cgColor
        logTextBox.layer.borderWidth = 1
        logTextBox.layer.cornerRadius = 8
        logTextBox.clipsToBounds = true
        logTextBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logTextBox)
        
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = UIFont.systemFont(ofSize: 16)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodLabel)
        
        moodStack = UIStackView()
        moodStack.axis = .horizontal
        moodStack.alignment = .center
        moodStack.distribution = .fillEqually
        moodStack.spacing = 12
        moodStack.translatesAutoresizingMaskIntoConstraints = false

        for mood in moodOptions {
            let moodLabel = UILabel()
            moodLabel.text = mood
            moodLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            moodLabel.textAlignment = .center
            moodLabel.textColor = .black
            moodLabel.layer.borderWidth = 1
            moodLabel.layer.borderColor = UIColor.black.cgColor
            moodLabel.layer.cornerRadius = 20
            moodLabel.clipsToBounds = true
            moodLabel.backgroundColor = .white
            
            moodLabel.translatesAutoresizingMaskIntoConstraints = false
            moodLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            moodLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
            
            moodStack.addArrangedSubview(moodLabel)
        }
        view.addSubview(moodStack)
        

        stressLabel = UILabel()
        stressLabel.text = "Stress"
        stressLabel.font = UIFont.systemFont(ofSize: 16)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stressLabel)
        
        stressSlider = UISlider()
        stressSlider.minimumValue = 1
        stressSlider.maximumValue = 10
        stressSlider.value = 5
        stressSlider.isUserInteractionEnabled = false
        stressSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stressSlider)
        
        minLabel = UILabel()
        minLabel.text = "0"
        minLabel.textColor = .secondaryLabel
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minLabel)
        
        maxLabel = UILabel()
        maxLabel.text = "10"
        maxLabel.textColor = .secondaryLabel
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maxLabel)
        
        initConstraints()
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            logLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            logTextBox.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 20),
            logTextBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logTextBox.heightAnchor.constraint(equalToConstant: 100),
            
            moodLabel.topAnchor.constraint(equalTo: logTextBox.bottomAnchor, constant: 20),
            moodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            moodStack.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 20),
            moodStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moodStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stressLabel.topAnchor.constraint(equalTo: moodStack.bottomAnchor, constant: 20),
            stressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            minLabel.leadingAnchor.constraint(equalTo: stressSlider.leadingAnchor),
            minLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),
            
            stressSlider.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 10),
            stressSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stressSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            maxLabel.trailingAnchor.constraint(equalTo: stressSlider.trailingAnchor),
            maxLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),
        ])
    }
    
    func updateDateLabel() {
        guard let date = selectedDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateLabel.text = dateFormatter.string(from: date)
    }
}
