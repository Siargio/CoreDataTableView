//
//  UsersViewController.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

class UsersViewController: UIViewController {

    // MARK: - View

    private var userView: UsersView? {
        guard isViewLoaded else { return nil }
        return view as? UsersView
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = UsersView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }


}

// MARK: - Setups

extension UsersViewController {

    func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = Strings.navigationTitle
    }
}

// MARK: - Constants

extension UsersViewController {

    enum Strings {
        static let navigationTitle: String = "Users"
    }
}
