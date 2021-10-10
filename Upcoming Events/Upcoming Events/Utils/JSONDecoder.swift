//
//  JSONDecoder.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

class JSONDecodable {
    
    let decoder =  JSONDecoder()
    
    func decode<T>(type: [T.Type], fromFile name: String) -> Result<[T], DecodeError> where T : Decodable {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            return .failure(.unknown)
        }
    
        do {
            let result = try decoder.decode([T].self, from: data)
            return .success(result)
        } catch {
            return .failure(.decode(error: error.localizedDescription))
        }
    }
}
