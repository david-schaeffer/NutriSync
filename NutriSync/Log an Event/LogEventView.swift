import UIKit

class LogEventView: UIView {
    
    // COMPONENTS
    var logEventLabel: UILabel!
    var eventNameTextField: UITextField!
    var dateLabel: UILabel!
    var datePicker: UIDatePicker!
    var dateFormatter: DateFormatter!
    var moodLabelView: UIStackView!
    var moodLabel: UILabel!
    var moodLabelDescription: UILabel!
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
        setupLogEventLabel()
        setupEventNameTextField()
        setupDateLabel()
        setupDatePicker()
        setupMoodLabel()
        setupMoodScrollView()
        setupMoodStackView()
        setupStressLabel()
        setupStressSlider()
        setupMinLabel()
        setupMaxLabel()
        setupLogButton()
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy, h:mm a"
        
        initConstraints()
    }
    
    
    func setupLogEventLabel() {
        logEventLabel = UILabel()
        logEventLabel.text = "Log an Event"
        logEventLabel.font = .boldSystemFont(ofSize: 20)
        logEventLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logEventLabel)
    }
    
    func setupEventNameTextField() {
        eventNameTextField = UITextField()
        eventNameTextField.placeholder = "What event do you have coming up?"
        eventNameTextField.borderStyle = .roundedRect
        eventNameTextField.font = UIFont.systemFont(ofSize: 16)
        eventNameTextField.textColor = .black
        eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(eventNameTextField)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.text = "Date"
        dateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = Date()
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
    }
    
    func setupMoodLabel() {
        moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.font = UIFont.boldSystemFont(ofSize: 16)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        
        moodLabelDescription = UILabel()
        moodLabelDescription.text = "How do you feel about this event?"
        moodLabelDescription.font = UIFont.systemFont(ofSize: 12)
        moodLabelDescription.textColor = .lightGray
        moodLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        moodLabelView = UIStackView(arrangedSubviews: [moodLabel, moodLabelDescription])
        moodLabelView.axis = .vertical
        moodLabelView.alignment = .leading
        moodLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(moodLabelView)
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
        stressLabel.text = "Stress: 1"
        stressLabel.font = .boldSystemFont(ofSize: 17)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressLabel)
    }
    
    func setupStressSlider() {
        stressSlider = UISlider()
        stressSlider.minimumValue = 0
        stressSlider.maximumValue = 10
        stressSlider.value = 1
        stressSlider.isContinuous = true
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
        logButton.backgroundColor = .accent
        logButton.layer.cornerRadius = 25
        logButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
                logEventLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                logEventLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

                eventNameTextField.topAnchor.constraint(equalTo: logEventLabel.bottomAnchor, constant: 16),
                eventNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                eventNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                dateLabel.topAnchor.constraint(equalTo: eventNameTextField.bottomAnchor, constant: 16),
                dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

                datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
                datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                moodLabelView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
                moodLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

                moodScrollView.topAnchor.constraint(equalTo: moodLabelView.bottomAnchor, constant: 16),
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

                minLabel.leadingAnchor.constraint(equalTo: stressSlider.leadingAnchor),
                minLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),

                maxLabel.trailingAnchor.constraint(equalTo: stressSlider.trailingAnchor),
                maxLabel.topAnchor.constraint(equalTo: stressSlider.bottomAnchor, constant: 4),

                logButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
                logButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                logButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                logButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

