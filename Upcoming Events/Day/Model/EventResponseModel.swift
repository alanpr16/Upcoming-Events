//
//  EventResponseModel.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

struct EventResponseModel: Decodable {
    let title: String
    let start: String
    let end: String
}

extension EventResponseModel {
    func mapToModel() -> Event {
        Event(title: title,
              start: start.toDate(),
              end: end.toDate())
    }
}
