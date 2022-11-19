//
//  InfoUserController.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit
protocol InfoUserInfoProtocol: AnyObject {
    func saveData()
}

class UserInfoViewController: UIViewController, InfoUserInfoProtocol {

    var presenter: UserInfoPresenterProtocol?
    private var isActivity = true
    private var gender: String?

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
        setupNavigationController()
        notActivity()
        setupActions()
    }
}

// MARK: - Settings

extension UserInfoViewController {

    private func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = editButton
    }

    private func notActivity() {
        userInfoView?.userNameTextField.isEnabled = false
        userInfoView?.birthdayDatePicker.isEnabled = false
        userInfoView?.genderControl.isEnabled = false
    }

    func saveData() {
        print("aaaa")
        presenter?.updateUsersInfo(name: userInfoView?.userNameTextField.text,
                                   birthDay: userInfoView?.birthdayDatePicker.date,
                                   gender: gender)
        switch gender {
        case Gender.male.rawValue:
            userInfoView?.genderControl.selectedSegmentIndex = 0
        case Gender.female.rawValue:
            userInfoView?.genderControl.selectedSegmentIndex = 1
        default:
            break
        }
    }
}

// MARK: - Action

extension UserInfoViewController {

    @objc func editButtonAction() {
        if isActivity {
            userInfoView?.userNameTextField.isEnabled = true
            userInfoView?.birthdayDatePicker.isEnabled = true
            userInfoView?.genderControl.isEnabled = true
            isActivity = false
            editButton.title = "Save"
        } else {
            userInfoView?.userNameTextField.isEnabled = false
            userInfoView?.birthdayDatePicker.isEnabled = false
            userInfoView?.genderControl.isEnabled = false
            isActivity = true
            editButton.title = "Edit"
            saveData()
        }
    }

    func setupActions() {
        userInfoView?.genderControl.addTarget(nil, action: #selector(segmentDidChange(_:)), for: .valueChanged)
    }

    @objc private func segmentDidChange(_ sender: UISegmentedControl) {
        if userInfoView?.genderControl.selectedSegmentIndex == 0 {
            gender = Gender.male.rawValue
        } else {
            gender = Gender.female.rawValue
        }
    }
}

// MARK: - Constants

extension UserInfoViewController {

    enum Strings {
        static let navigationButtonEdit: String = "Edit"
    }
}

