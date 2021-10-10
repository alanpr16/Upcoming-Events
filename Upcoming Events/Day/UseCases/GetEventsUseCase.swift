//
//  GetEventsUseCase.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

final class GetEventsUseCase {
    
    let decodable: JSONDecodable
    let sampleData: String
    
    init(decodable: JSONDecodable = JSONDecodable(),
         sampleData: String = "SampleData") {
        self.decodable = decodable
        self.sampleData = sampleData
    }

    func invoke() -> [Event] {
        let result = decodable.decode(type: [EventResponseModel.self], fromFile: sampleData)
        
        switch result {
        case .success(let response):
            return response.compactMap { $0.mapToModel() }.sorted { $0.start < $1.start }
        case .failure:
            return []
        }
    }
}
