//
//  ListOfDaysViewController.swift
//  Upcoming Events
//
//  Created by Alan on 08/10/21.
//

import UIKit

class ListOfDaysViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let bundle = Bundle(for: type(of: self))
        collectionView.register(DayCollectionViewCell.self,
                                forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var listOfDaysPresenter: ListOfDaysPresenter = ListOfDaysPresenter(delegate: self)
    
    var days: [DayViewData]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        title = "Upcoming Events"
        view.addSubview(collectionView)
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfDaysPresenter.getDays()
    }
}

extension ListOfDaysViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        days?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let day = days?[indexPath.row],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseIdentifier,
                                                          for: indexPath) as? DayCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.day = day
        return cell
    }
}

extension ListOfDaysViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listOfDaysPresenter.didSelectDay(row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension ListOfDaysViewController: ListOfDaysDelegate {
    
    func display(days: [DayViewData]?) {
        self.days = days
    }
    
    func goToDayDetails(presenter: DayViewPresenter) {
        let viewController = DayViewController(presenter: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
