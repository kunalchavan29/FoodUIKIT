//
//  CategoryViewController.swift
//  FoodUI
//
//  Created by Kunal Chavan on 03/10/22.
//

import UIKit
enum FoodCategories: Int, CaseIterable {
    case hotDeals
    case categories
    case lastVisited
    case nearByPopular
    case reservation
    case nearByOffer
}

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        tableView.backgroundColor = .clear
        let dealsId = String(describing: DealsTableViewCell.self)
        tableView.register(UINib(nibName: dealsId, bundle: nil), forCellReuseIdentifier: dealsId)
        let categoryId = String(describing: CategoriesTableViewCell.self)
        tableView.register(UINib(nibName: categoryId, bundle: nil), forCellReuseIdentifier: categoryId)
        let lastVisitedId = String(describing: LastVisitedTableViewCell.self)
        tableView.register(UINib(nibName: lastVisitedId, bundle: nil), forCellReuseIdentifier: lastVisitedId)
        let nearByPopular = String(describing: NearByPopularTableViewCell.self)
        tableView.register(UINib(nibName: nearByPopular, bundle: nil), forCellReuseIdentifier: nearByPopular)
        let reservationId = String(describing: ReservationTableViewCell.self)
        tableView.register(UINib(nibName: reservationId, bundle: nil), forCellReuseIdentifier: reservationId)
        let nearByOfferId = String(describing: NearByOffersTableViewCell.self)
        tableView.register(UINib(nibName: nearByOfferId, bundle: nil), forCellReuseIdentifier: nearByOfferId)
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodCategories.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier = ""
        switch indexPath.row {
        case FoodCategories.hotDeals.rawValue:
            identifier = String(describing: DealsTableViewCell.self)
        case FoodCategories.categories.rawValue:
            identifier = String(describing: CategoriesTableViewCell.self)
        case FoodCategories.lastVisited.rawValue:
            identifier = String(describing: LastVisitedTableViewCell.self)
        case FoodCategories.nearByPopular.rawValue:
            identifier = String(describing: NearByPopularTableViewCell.self)
        case FoodCategories.reservation.rawValue:
            identifier = String(describing: ReservationTableViewCell.self)
        case FoodCategories.nearByOffer.rawValue:
            identifier = String(describing: NearByOffersTableViewCell.self)
        default:
            fatalError("handle new case")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case FoodCategories.hotDeals.rawValue:
            return 140
        case FoodCategories.categories.rawValue:
            return 260
        case FoodCategories.lastVisited.rawValue:
            return 156
        case FoodCategories.nearByPopular.rawValue:
            return 246
        case FoodCategories.reservation.rawValue:
            return 296
        case FoodCategories.nearByOffer.rawValue:
            return 206
        default:
            return 200
        }
    }
}
