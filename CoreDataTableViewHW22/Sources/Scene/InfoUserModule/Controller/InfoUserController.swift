//
//  InfoUserController.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

class UserInfoViewController: UIViewController {

    // MARK: - View

    private var userInfoView: UserInfoView? {
        guard isViewLoaded else { return nil }
        return view as? UserInfoView
    }

    private lazy var editButton = UIBarButtonItem(title: Strings.navigationButtonEdit,
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(editButtonAction))

    // MARK: - View Life Cycle

    override func loadView() {
        view = UserInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Settings

extension UserInfoViewController {

    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = editButton
    }
}

// MARK: - Action

extension UserInfoViewController {

    @objc func editButtonAction() {
    }
}

// MARK: - Constants

extension UserInfoViewController {

    enum Strings {
        static let navigationButtonEdit: String = "Edit"
    }
}

