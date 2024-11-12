import UIKit

class LogEventView: UIView {
    
    // COMPONENTS
    var logEventLabel: UILabel!
    var eventNameTextField: UITextField!
    var dateLabel: UILabel!
    var datePicker: UIDatePicker!
    var dateFormatter: DateFormatter!
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
        eventNameTextField.placeholder = "Enter the event you are attending"
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
        moodLabel.font = .boldSystemFont(ofSize: 17)
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
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor
//            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            moodStackView.addArrangedSubview(button)
        }
    }
    
    func setupStressLabel() {
        stressLabel = UILabel()
        stressLabel.text = "Stress"
        stressLabel.font = .boldSystemFont(ofSize: 17)
        stressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressLabel)
    }
    
    func setupStressSlider() {
        stressSlider = UISlider()
        stressSlider.minimumValue = 1
        stressSlider.maximumValue = 10
        stressSlider.value = 1
        stressSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stressSlider)
    }
    
    func setupMinLabel() {
        minLabel = UILabel()
        minLabel.text = "1"
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

                moodLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
                moodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

                moodScrollView.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 8),
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

                minLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                minLabel.centerYAnchor.constraint(equalTo: stressSlider.centerYAnchor),

                maxLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                maxLabel.centerYAnchor.constraint(equalTo: stressSlider.centerYAnchor),

                logButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
                logButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                logButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                logButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

