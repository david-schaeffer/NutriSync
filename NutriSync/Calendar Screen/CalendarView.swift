import UIKit

class CalendarView: UIView {

    // COMPONENTS
    var scrollView: UIScrollView!
    var calendarLabel: UILabel!
    var monthlyCalendarView: UICalendarView!
    var tabBar: UITabBar!

    let calendarViewDelegate = CalendarViewDelegate()

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
        setupCalendarLabel()
        setupCalendarView()
        initConstraints()
    }

    func setupCalendarLabel() {
        calendarLabel = UILabel()
        calendarLabel.text = "Calendar"
        calendarLabel.font = UIFont.boldSystemFont(ofSize: 24)
        calendarLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(calendarLabel)
    }

    func setupCalendarView() {
        monthlyCalendarView = UICalendarView()
        monthlyCalendarView.delegate = calendarViewDelegate
        monthlyCalendarView.calendar = Calendar(identifier: .gregorian)
        monthlyCalendarView.locale = Locale(identifier: "en_US_POSIX")
        monthlyCalendarView.fontDesign = .rounded
        monthlyCalendarView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(monthlyCalendarView)

        // Configure selection behavior
        monthlyCalendarView.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            calendarLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            calendarLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),

            monthlyCalendarView.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 16),
            monthlyCalendarView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            monthlyCalendarView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            monthlyCalendarView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -130),
        ])
    }

    func presentHalfModal(for date: Date) {
        let dayVC = DayViewController()
        dayVC.modalPresentationStyle = .pageSheet
        dayVC.selectedDate = date // Pass the selected date to DayViewController

        if let sheet = dayVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
        self.window?.rootViewController?.present(dayVC, animated: true, completion: nil)
    }
}

// MARK: - UICalendarSelectionSingleDateDelegate

extension CalendarView: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents,
              let selectedDate = Calendar.current.date(from: dateComponents) else { return }
        
        presentHalfModal(for: selectedDate)
    }
}
