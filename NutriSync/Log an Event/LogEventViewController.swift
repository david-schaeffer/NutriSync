//
//  LogEventViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogEventViewController: UIViewController {
    
    var logEventView: LogEventView!
    var moods: [String] = []
    var userId: Int!
    
    init(userId: Int) {
        super.init(nibName: "LogEventViewController", bundle: nil)
        self.userId = userId
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        self.logEventView.stressSlider.addTarget(self, action: #selector(stressSliderValueChanged), for: .valueChanged)
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
//        Task {
//            await logEventAction()
//        }
        
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
    
    @MainActor
    private func logEventAction() async {
        let stressLevel = Int(self.logEventView.stressSlider.value)
        let event = self.logEventView.eventNameTextField.text!
        let eventDate = self.logEventView.datePicker.date
        
        do {
            try await PGClient.shared.connect()
        } catch {
            print("Failed to connect to the database: \(error)")
        }
        
        do {
            try await PGClient.shared.logEvent(userId: userId, moodTags: moods, stressLevel: stressLevel, eventName: event, eventDate: eventDate)
        } catch {
            fatalError("Error logging mood: \(String(reflecting: error))")
        }
        
        do {
            try await PGClient.shared.disconnect()
        } catch {
            print("Error disconnecting: \(error)")
        }
    }
    
    @objc private func stressSliderValueChanged(_ sender: UISlider) {
        self.logEventView.stressLabel.text = "Stress: \(Int(sender.value))"
    }
}
