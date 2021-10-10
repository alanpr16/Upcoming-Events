//
//  ListOfDaysPresenter.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import Foundation

protocol ListOfDaysDelegate: AnyObject {
    func display(days: [DayViewData]?)
    func goToDayDetails(presenter: DayViewPresenter)
}

class ListOfDaysPresenter {
    
    let getDaysUseCase: GetDaysUseCase = GetDaysUseCase()
    var days: [Day]?
    
    weak var delegate: ListOfDaysDelegate?
    
    init(delegate: ListOfDaysDelegate){
        self.delegate = delegate
    }
    
    func getDays() {
        days = getDaysUseCase.invoke()
        let daysToShow = days?.map { $0.mapToViewData() }
        delegate?.display(days: daysToShow)
    }
    
    func didSelectDay(row: Int) {
        guard let day = days?[row] else { return  }
        let presenter = DayViewPresenter(day: day)
        delegate?.goToDayDetails(presenter: presenter)
    }
}
