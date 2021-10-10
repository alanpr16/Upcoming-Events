//
//  String+Extensions.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

extension String {
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "MMMM d, yyyy h:mm a"
        let date = dateFormatter.date(from: self) ?? Date()
        
        return date
    }
}
