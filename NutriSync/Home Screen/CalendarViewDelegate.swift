//
//  CalendarViewDelegate.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/12/24.
//

import UIKit

class CalendarViewDelegate: NSObject, UICalendarViewDelegate {
    var calendarView: UICalendarView? = nil
    var decorations: [Date?: UICalendarView.Decoration]
    
    override init() {
        // Load days with logs in order to decorate
        // For now, add dummy decoration to today
        
        let randomDateComponents: [DateComponents] = [
            DateComponents(
                calendar: Calendar(identifier: .gregorian),
                year: 2024,
                month: 11,
                day: 6
            ),
            DateComponents(
                calendar: Calendar(identifier: .gregorian),
                year: 2024,
                month: 11,
                day: 2
            ),
            DateComponents(
                calendar: Calendar(identifier: .gregorian),
                year: 2024,
                month: 11,
                day: 9
            ),
            DateComponents(
                calendar: Calendar(identifier: .gregorian),
                year: 2024,
                month: 11,
                day: 12
            )
        ]
            
        decorations = [:]
        
        for dateComponent in randomDateComponents {
            decorations.updateValue(UICalendarView.Decoration.default(color: .darkGray, size: .small), forKey: dateComponent.date)
        }
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        // Get a copy of the date components that only contain
        // the calendar, year, month, and day.
        let day = DateComponents(
            calendar: dateComponents.calendar,
            year: dateComponents.year,
            month: dateComponents.month,
            day: dateComponents.day
        )
            
        // Return any decoration saved for that date.
        return decorations[day.date]
    }
}
