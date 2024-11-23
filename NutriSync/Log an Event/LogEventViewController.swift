import UIKit

class LogEventViewController: UIViewController {
    
    var logEventView: LogEventView!
    var moods: [String] = []
    
    override func loadView() {
        self.logEventView = LogEventView()
        view = logEventView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logEventView.moodStackView.arrangedSubviews.forEach {
            guard let moodButton = $0 as? UIButton else { return }
            moodButton.addTarget(self, action: #selector(moodButtonTapped), for: .touchUpInside)
        }
        
        self.logEventView.logButton.addTarget(self, action: #selector(logButtonTapped), for: .touchUpInside)
    }
    
    @objc private func moodButtonTapped(_ sender: UIButton) {
        guard let mood = sender.titleLabel?.text else { return }
        
        if self.moods.contains(mood) {
            // Deselect mood
            let index = self.moods.firstIndex(of: mood)!
            self.moods.remove(at: index)
            sender.backgroundColor = .white
            sender.setTitleColor(.black, for: .normal)
        } else {
            // Select mood
            self.moods.append(mood)
            sender.backgroundColor = .accent
            sender.setTitleColor(.white, for: .normal)
        }
    }
    
    @objc private func logButtonTapped(_ sender: UIButton) {
        let moodsString = self.moods.joined(separator: ", ")
        let stressLevel = self.logEventView.stressSlider.value
        let event = self.logEventView.eventNameTextField.text!
        print("Logged event: \(event) with moods: \(moodsString) and stress level: \(stressLevel)")
        
        if let tabBC = sender.window?.rootViewController as? UITabBarController {
            let currentTabIndex = tabBC.selectedIndex
            let logNavigationController = tabBC.viewControllers?[currentTabIndex] as? UINavigationController
            logNavigationController?.popViewController(animated: true)
            
            logNavigationController?.present(SuccessPopUpViewController(), animated: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                logNavigationController?.dismiss(animated: false)
            }
        }
    }
}
