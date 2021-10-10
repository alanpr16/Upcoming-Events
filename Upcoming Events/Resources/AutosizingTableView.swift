//
//  AutosizingTableView.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

import UIKit

final class AutosizingTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return .init(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}


