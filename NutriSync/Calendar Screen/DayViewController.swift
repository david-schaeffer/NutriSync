import UIKit

class DayViewController: UIViewController {
    
    // UI Components
    var dateLabel: UILabel!
    var logLabel: UILabel!          // Static text for log
    var moodLabel: UILabel!
    var moodDisplayLabel: UILabel!  // Static text for mood
    var stressLabel: UILabel!       // Label for stress description
    var stressSlider: UISlider!     // Slider to show static stress level
    
    var selectedDate: Date?         // Property to hold the selected date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateDateLabel()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        
        // Date Label
        dateLabel = UILabel()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        dateLabel.textAlignment = .center
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        // Log Label (static text)
        logLabel = UILabel()
        logLabel.text = "Today, I ate oatmeal with frozen berries for brunch."
        logLabel.font = UIFont.systemFont(ofSize: 16)
        logLabel.numberOfLines = 0 // Allows label to wrap text
        logLabel.layer.borderColor = UIColor.lightGray.cgColor
        logLabel.layer.borderWidth = 1
        logLabel.layer.cornerRadius = 8
        logLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logLabel)
        
        // Mood Label
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = UIFont.systemFont(ofSize: 16)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodLabel)
        
        
        // Mood Display Label (static text for mood)
        moodDisplayLabel = UILabel()
        moodDisplayLabel.text = "Happy" // Example mood
        moodDisplayLabel.font = UIFont.systemFont(ofSize: 16)
        moodDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodDisplayLabel)
        
        // Stress Label
        stressLabel = UILabel()
        stressLabel.text = "Stress Level"
        stressLabel.font = UIFont.systemFont(ofSize: 16)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stressLabel)
        
        // Stress Slider (display-only, non-interactive)
        stressSlider = UISlider()
        stressSlider.minimumValue = 1
        stressSlider.maximumValue = 10
        stressSlider.value = 5  // Set the static stress level here
        stressSlider.isUserInteractionEnabled = false  // Disable interaction to make it static
        stressSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stressSlider)
        
        initConstraints()
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            logLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logLabel.heightAnchor.constraint(equalToConstant: 100),
            
            moodLabel.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 20),
            moodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            moodDisplayLabel.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 10),
            moodDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            stressLabel.topAnchor.constraint(equalTo: moodDisplayLabel.bottomAnchor, constant: 20),
            stressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            stressSlider.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 10),
            stressSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stressSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func updateDateLabel() {
        guard let date = selectedDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateLabel.text = dateFormatter.string(from: date)
    }
}
