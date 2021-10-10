//
//  DecodeError.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

enum DecodeError: Error {
    case unknown
    case decode(error: String)
}
