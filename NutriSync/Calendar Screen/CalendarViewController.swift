//
//  CalendarViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class CalendarViewController: UIViewController {

    var calendarView: CalendarView!
    
    override func loadView() {
        self.calendarView = CalendarView()
        view = calendarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
