//
//  Event.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

struct Event{
    let title: String
    let start: Date
    let end: Date
}

extension Event {
    func mapToViewData() -> EventViewData {
        return EventViewData(title: title,
                             startHour: start.get(.hour),
                             startMinutes: start.get(.minute),
                             endHour: end.get(.hour),
                             endMinutes: end.get(.minute))
    }
}
