//
//  UsersViewController.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

class UsersViewController: UIViewController {

    var presenter: UsersPresenterProtocol?
    var userInfo: [UserInfo] = []

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
            
            userView?.textFieldPrint.text = ""
        } else {
            let alert = UIAlertController(title: "Print name user", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok!", style: .cancel))
            self.present(alert, animated: true)
        }
        userView?.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = userInfo[indexPath.row]
        //cell.textLabel?.text = userInfo.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}

// MARK: - UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userInfo[indexPath.row]
        let viewController = UserInfoViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Constants

extension UsersViewController {

    enum Strings {
        static let navigationTitle: String = "Users"
    }
}
