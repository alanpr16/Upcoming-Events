//
//  DayCollectionViewCell.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: DayCollectionViewCell.self)
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var day: DayViewData? {
        didSet {
            guard let day = day else { return }
            monthLabel.text = "\(day.month)"
            numberLabel.text = "\(day.number)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(headerView)
        contentView.addSubview(numberLabel)
        headerView.addSubview(monthLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = traitCollection.horizontalSizeClass == .compact ?
            min(min(frame.width, frame.height) - 10, 60) : 45
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: size),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
