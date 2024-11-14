//
//  LogMealViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LogMealViewController: UIViewController {

    var logMealView: LogMealView!
    
    override func loadView() {
        self.logMealView = LogMealView()
        view = logMealView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Log a Meal"

    }
}
