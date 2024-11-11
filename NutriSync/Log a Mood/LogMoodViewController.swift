//
//  LogMoodViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogMoodViewController: UIViewController {

    var logMoodView: LogMoodView!
    
    override func loadView() {
        self.logMoodView = LogMoodView()
        view = logMoodView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
