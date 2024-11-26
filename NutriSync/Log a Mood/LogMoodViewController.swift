//
//  LogMoodViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogMoodViewController: UIViewController {

    var logMoodView: LogMoodView!
    var moods: [String] = []
    
    override func loadView() {
        self.logMoodView = LogMoodView()
        view = logMoodView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logMoodView.moodStackView.arrangedSubviews.forEach {
            guard let moodButton = $0 as? UIButton else { return }
            moodButton.addTarget(self, action: #selector(moodButtonTapped), for: .touchUpInside)
        }
        
        self.logMoodView.logButton.addTarget(self, action: #selector(logButtonTapped), for: .touchUpInside)
        
        self.logMoodView.stressSlider.addTarget(self, action: #selector(stressSliderValueChanged), for: .valueChanged)
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
        let stressLevel = self.logMoodView.stressSlider.value
        print("Logged moods: \(moodsString) and stress level: \(stressLevel)")
        
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
    
    @objc private func stressSliderValueChanged(_ sender: UISlider) {
        self.logMoodView.stressLabel.text = "Stress: \(Int(sender.value))"
    }
}
