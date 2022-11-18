//
//  AssemblyMain.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

protocol AssemblyMainProtocol {
    func createUserModule(router: RouterProtocol) -> UIViewController
    func createUserInfoModule(router: RouterProtocol, userInfo: UserInfo?) -> UIViewController
}

class AssemblyMain: AssemblyMainProtocol {

    func createUserModule(router: RouterProtocol) -> UIViewController {
        let view = UsersViewController()
        let model = ManagedModel()
        let presenter = UsersPresenter(model: model, router: router)
        view.presenter = presenter
        return view
    }

    func createUserInfoModule(router: RouterProtocol, userInfo: UserInfo?) -> UIViewController {
        let view = UserInfoViewController()
        let model = ManagedModel()
//        let presenter = UserInfoPresenterProtocol()
//        view.presenter = presenter
        return view
    }
}
