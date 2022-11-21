//
//  UsersInfoPresenter.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 18.11.22.
//

import Foundation

// MARK: - UsersPresenterProtocol

protocol UserInfoPresenterProtocol: AnyObject {
    var userInfo: UserInfo? { get set }
    init(manager: ManagedModelProtocol, userInfo: UserInfo)
    func updateUsersInfo(name: String?, birthDay: Date?, gender: String?)
}

// MARK: - UsersPresenter

class UserInfoPresenter: UserInfoPresenterProtocol {

    var userInfo: UserInfo?
    var manager: ManagedModelProtocol

    required init(manager: ManagedModelProtocol, userInfo: UserInfo) {
        self.manager = manager
        self.userInfo = userInfo
    }

    func updateUsersInfo(name: String?,
                         birthDay: Date?,
                         gender: String?) {

        guard let userInfo = userInfo else { return }
        manager.updateUsersInfo(userInfo: userInfo,
                                name: name,
                                birthDay: birthDay,
                                gender: gender)
    }
}
