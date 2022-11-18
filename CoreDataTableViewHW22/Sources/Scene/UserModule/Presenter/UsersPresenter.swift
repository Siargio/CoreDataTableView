//
//  UsersPresenter.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 18.11.22.
//

import Foundation

// MARK: - UsersPresenterProtocol

protocol UsersPresenterProtocol: AnyObject {
    init(model: ManagedModelProtocol, router: RouterProtocol)
    var userInfo: [UserInfo] { get set }

    func saveName(name: String) //сохраняем имя
    func deleteUser(indexPath: IndexPath)// удаляем юзера
    func fetchUsersInfo()// приравниваем модель к модели
    func showUserInfoViewController(userInfo: UserInfo?)// переход на userInfoVC
}

// MARK: - UsersPresenter

class UsersPresenter: UsersPresenterProtocol {

    var userInfo = [UserInfo]()
    var model: ManagedModelProtocol
    var router: RouterProtocol?

    required init(model: ManagedModelProtocol, router: RouterProtocol) {
        self.model = model
        self.router = router
    }

    func saveName(name: String) {
        model.saveUsers(name: name)
    }

    func deleteUser(indexPath: IndexPath) {
        model.deleteUser(userInfo: userInfo[indexPath.row])
    }

    func fetchUsersInfo() {
        userInfo = model.fetchUsers() ?? []
    }

    func showUserInfoViewController(userInfo: UserInfo?) {
        router?.showInfoUserViewController(userInfo: userInfo)
    }

}
