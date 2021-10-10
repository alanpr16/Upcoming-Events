//
//  HourTableViewCell.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

import UIKit

class HourTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: HourTableViewCell.self)
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryView = .none
        contentView.addSubview(hourLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(lineView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            hourLabel.topAnchor.constraint(equalTo: topAnchor),
            hourLabel.widthAnchor.constraint(equalToConstant: 35),
            hourLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: hourLabel.trailingAnchor, constant: 8),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: lineView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: lineView.trailingAnchor)
        ])
    }
    
    func setup(hour: Int, events: [EventViewData] = []) {
        hourLabel.text = hour.toHour()
        events.forEach { self.createEventView(with: $0, for: hour) }
    }
}

extension HourTableViewCell {
    func createEventView(with event: EventViewData, for hour: Int) {
        let startAnchorConstant = hour == event.startHour ? CGFloat(event.startMinutes) : 0.0
        let endMinutes: CGFloat = event.endMinutes == 0 ? 60.0 : CGFloat(event.endMinutes)
        let endAnchorConstant = hour == event.endHour ? endMinutes : 0.0
        let eventView = EventView(title: event.title)
        stackView.addArrangedSubview(eventView)
        eventView.topAnchor.constraint(equalTo: topAnchor, constant: startAnchorConstant).isActive = true
        eventView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -endAnchorConstant).isActive = true
    }
}
