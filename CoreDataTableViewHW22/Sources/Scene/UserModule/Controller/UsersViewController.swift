//
//  UsersViewController.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

class UsersViewController: UIViewController {

    var presenter: UsersPresenterProtocol?

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
        setupView()
        presenter?.fetchUsersInfo()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userView?.tableView.reloadData()
    }
}

// MARK: - Setups

extension UsersViewController {

    func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = Strings.navigationTitle
    }

    func setupView() {
        userView?.tableView.dataSource = self
        userView?.tableView.delegate = self
        userView?.pressButton.addTarget(self, action: #selector(addUser), for: .touchUpInside)
    }
}

// MARK: - Action

extension UsersViewController {
    
    @objc func addUser() {
        if userView?.textFieldPrint.text != "" {
            let username = userView?.textFieldPrint.text ?? ""
            presenter?.saveName(name: username)
            presenter?.fetchUsersInfo()
            userView?.textFieldPrint.text = nil
        } else {
            let alert = UIAlertController(title: Strings.alertTitle, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Strings.alertActionTitle, style: .cancel))
            self.present(alert, animated: true)
        }
        userView?.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.userInfo.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let user = presenter?.userInfo[indexPath.row]
        cell.textLabel?.text = user?.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.deleteUser(indexPath: indexPath)
            presenter?.userInfo.remove(at: indexPath.row)
            userView?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showUserInfoViewController(by: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension UsersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addUser()
        return true
    }
}
// MARK: - Constants

extension UsersViewController {

    enum Strings {
        static let navigationTitle: String = "Users"
        static let alertTitle: String = "Print name user"
        static let alertActionTitle: String = "Ok!"
    }
}
