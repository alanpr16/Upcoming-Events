//
//  Int+Extensions.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

extension Int {
    
    func toHour() -> String {
        switch self {
        case 0...9:
            return "0\(self):00"
        default:
            return "\(self):00"
        }
    }
}
