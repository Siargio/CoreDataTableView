//
//  Router.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

// MARK: - RouterProtocol

protocol RouterProtocol {
    // для каждого роутера нужен свой навигейшен контроллер
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyMainProtocol? { get set }// ассемблер

    func initialViewController()// Вьюконтроллер с которого будет стартовать
    func showInfoUserViewController(userInfo: UserInfo?)
}

// MARK: - RouterModule

class Router: RouterProtocol { // роутер только для навигации

    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyMainProtocol?

    // MARK: - Initialization

    init(navigationController: UINavigationController, assemblyBuilder: AssemblyMainProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() { // инициализация первого контроллера userViewController
        guard let navigationController = navigationController
        else {
            return }
        guard let userViewController = assemblyBuilder?.createUserModule(router: self)
        else {
            return }
        navigationController.viewControllers = [userViewController]
    }

    func showInfoUserViewController(userInfo: UserInfo?) { // инициализация второго контроллера userInfoViewControlle
        guard let navigationController = navigationController, let userInfo = userInfo else { return }
        guard let userInfoViewController = assemblyBuilder?.createUserInfoModule(userInfo: userInfo) else { return }
        navigationController.pushViewController(userInfoViewController, animated: true)
    }
}
