//
//  DayViewPresenter.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

import Foundation

protocol DayViewPresenterDelegate: AnyObject {
    func display(title: String, events viewData: [EventViewData])
}

final class DayViewPresenter {
    
    let day: Day
    
    weak var delegate: DayViewPresenterDelegate?
        
    init(day: Day) {
        self.day = day
    }
    
    func setView(delegate: DayViewPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getEvents() {
        let title = day.date.toString()
        let events = day.events.compactMap({ $0.mapToViewData() })
        delegate?.display(title: title, events: events)
    }
}
