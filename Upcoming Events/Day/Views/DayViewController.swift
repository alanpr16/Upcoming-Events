//
//  DayViewController.swift
//  Upcoming Events
//
//  Created by Alan on 10/10/21.
//

import UIKit

class DayViewController: UIViewController {
    
    enum Layout {
        static let numberOfRows = 24
        static let heightForRow: CGFloat = 60.0
        static let headerHeight: CGFloat = 30.0
    }
    
    lazy var tableView: UITableView = {
        let tableView = AutosizingTableView()
        tableView.register(HourTableViewCell.self,
                           forCellReuseIdentifier: HourTableViewCell.reuseIdentifier)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = true
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
        
    var events: [EventViewData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let dayViewPresenter: DayViewPresenter
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(presenter: DayViewPresenter) {
        self.dayViewPresenter = presenter
        super.init(nibName: nil,
                   bundle: Bundle(for: type(of: self)))
        dayViewPresenter.setView(delegate: self)
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: guide.topAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewPresenter.getEvents()
    }
}

extension DayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Layout.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: HourTableViewCell.reuseIdentifier,
                                                     for: indexPath) as? HourTableViewCell
        else {
            return UITableViewCell()
        }
    
        let cellEvents = events.filter { ($0.startHour...$0.endHour).contains(indexPath.row) }
        cell.setup(hour: indexPath.row, events: cellEvents)
        
        return cell
    }
}

extension DayViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Layout.heightForRow
    }
}

extension DayViewController: DayViewPresenterDelegate {
    func display(title: String, events viewData: [EventViewData]) {
        self.title = title
        events = viewData
    }
}
