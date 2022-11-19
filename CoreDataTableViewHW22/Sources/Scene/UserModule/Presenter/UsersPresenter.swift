//
//  UsersPresenter.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 18.11.22.
//

import Foundation

// MARK: - UsersPresenterProtocol

protocol UsersPresenterProtocol: AnyObject {
    init(model: ManagedModelProtocol, router: RouterProtocol?)
    var userInfo: [UserInfo] { get set }
    var router: RouterProtocol? { get set }

    func saveName(name: String) //сохраняем имя
    func deleteUser(indexPath: IndexPath)// удаляем юзера
    func fetchUsersInfo()// приравниваем модель к модели
    func showUserInfoViewController(by indexPath: IndexPath)// переход на userInfoVC
}

// MARK: - UsersPresenter

class UsersPresenter: UsersPresenterProtocol {

    var userInfo = [UserInfo]()
    var model: ManagedModelProtocol
    var router: RouterProtocol?

    required init(model: ManagedModelProtocol, router: RouterProtocol?) {
        self.model = model
        self.router = router
        fetchUsersInfo()
        //userInfo = model.fetchUsers() ?? []
    }

    func saveName(name: String) {
        model.saveUsers(name: name)
        //userInfo = model.fetchUsers() ?? []
    }

    func deleteUser(indexPath: IndexPath) {
        model.deleteUser(userInfo: userInfo[indexPath.row])
    }

    func fetchUsersInfo() {
        userInfo = model.fetchUsers() ?? []
    }

    func showUserInfoViewController(by indexPath: IndexPath) {
        router?.showInfoUserViewController(userInfo: userInfo[indexPath.row])
    }

//    func updateUserInfo(userInfo: UserInfo, name: String, birthDay: Date, gender: String) {
//
//        model.updateUsersInfo(userInfo: userInfo, name: name, birthDay: birthDay, gender: gender)
//    }
}
