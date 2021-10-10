//
//  Day.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

struct Day {
    let date: Date
    let events: [Event]
}

extension Day {
    func mapToViewData() -> DayViewData {
        return DayViewData(month: date.getMonth(),
                           number: date.get(.day))
    }
}
