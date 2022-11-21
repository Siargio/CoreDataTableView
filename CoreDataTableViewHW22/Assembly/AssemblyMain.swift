//
//  AssemblyMain.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

protocol AssemblyMainProtocol {
    
    var manager: ManagedModelProtocol { get set }

    func createUserModule(router: RouterProtocol) -> UIViewController
    func createUserInfoModule(userInfo: UserInfo) -> UIViewController
}

class AssemblyMain: AssemblyMainProtocol {

    var manager: ManagedModelProtocol = ManagedModel()

    func createUserModule(router: RouterProtocol) -> UIViewController {
        let view = UsersViewController()
        let presenter = UsersPresenter(model: manager, router: router)
        view.presenter = presenter
        return view
    }

    func createUserInfoModule(userInfo: UserInfo) -> UIViewController {
        let view = UserInfoViewController()
        let presenter = UserInfoPresenter(manager: manager, userInfo: userInfo)
        view.presenter = presenter
        return view
    }
}
