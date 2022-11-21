//
//  AppDelegate.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let assembly = AssemblyMain()
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController, assemblyBuilder: assembly)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
