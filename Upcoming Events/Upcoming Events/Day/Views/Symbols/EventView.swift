//
//  EventView.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

import UIKit

class EventView: UIView {
    
    enum Layout {
        static let constantAnchor: CGFloat = 8.0
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(title: String?, frame: CGRect = .zero) {
        super.init(frame: frame)
        titleLabel.text = title
        addSubview(lineView)
        addSubview(titleLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .separator
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            lineView.widthAnchor.constraint(equalToConstant: 8),
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8 / 2),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 8)
        ])
    }
}
