//
//  Date+Extensions.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

extension Date {
    
    var startOfDay: Date {
        return Calendar.autoupdatingCurrent.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.autoupdatingCurrent.date(byAdding: components, to: startOfDay)!
    }
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let date = dateFormatter.string(from: self)
        return date.capitalized
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        calendar.component(component, from: self)
    }
    
    func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = "MMMM"
        let date = dateFormatter.string(from: self)
        return date.capitalized
    }
}

