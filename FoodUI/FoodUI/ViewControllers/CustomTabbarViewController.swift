//
//  CustomTabbarViewController.swift
//  FoodUI
//
//  Created by Kunal Chavan on 04/10/22.
//

import UIKit

class CustomTabbarViewController: UIViewController {
    @IBOutlet weak private var containerView: UIView!

    private var selectedIndex = 0
    private var currentViewController: UIViewController?

    private lazy var categoryViewController: CategoryViewController = {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CategoryViewController.self)) as? CategoryViewController else {
            fatalError("Unable to Instantiate CategoryViewController")
        }
        self.add(asChildViewController: viewController)
        return viewController
    }()

    private lazy var favoriteViewController: FavoriteViewController = {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: String(describing: FavoriteViewController.self)) as? FavoriteViewController else {
            fatalError("Unable to Instantiate FavoriteViewController")
        }
        self.add(asChildViewController: viewController)
        return viewController
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - View Methods
    private func setupView() {
        updateView()
    }

    private func updateView() {
        if let viewController = currentViewController {
            remove(asChildViewController: viewController)
        }
        let newViewController = getViewController(at: selectedIndex)
        add(asChildViewController: newViewController)
        currentViewController = newViewController
    }

    private func getViewController(at index: Int) -> UIViewController {
        switch index {
        case 0:
            return categoryViewController
        default:
            return favoriteViewController
        }
    }

    // MARK: - Actions
    @IBAction func didSelectedTabItem(sender: UIButton) {
        selectedIndex = sender.tag
        updateView()
    }

    // MARK: - Helper Methods

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        viewController.view.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }

}
