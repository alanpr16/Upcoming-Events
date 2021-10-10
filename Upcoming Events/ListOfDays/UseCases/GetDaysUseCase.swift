//
//  GetDaysUseCase.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

final class GetDaysUseCase {
    
    let getEvents: GetEventsUseCase
    let events: [Event]
    
    init(getEvents: GetEventsUseCase = GetEventsUseCase()) {
        self.getEvents = getEvents
        self.events = getEvents.invoke()
    }

    func invoke() -> [Day] {
        let calendar = Calendar.current
        let startDates: [Date] = events.map { event in
            let dateComponents = calendar.dateComponents([.year, .month, .day], from: event.start)
            let date = calendar.date(from: dateComponents)
            return date ?? nil
        }.compactMap { $0 }
        return Array(Set<Date>(startDates)).sorted().map { Day(date: $0, events: getEventsByDay(on: $0)) }
    }
    
    func getEventsByDay(on date: Date) -> [Event] {
        return events.filter { event -> Bool in
            let eventDate = event.start
            let startOfDay = eventDate.startOfDay
            let endOfDay = eventDate.endOfDay
            let range = startOfDay...endOfDay
            return range.contains(date)
        }
    }
}

