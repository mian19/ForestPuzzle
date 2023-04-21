//
//  AppDelegate.swift
//  ForestPuzzle
//
//  Created by foxtree on 21.04.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navController = UINavigationController()
        navController.navigationBar.isHidden = true
        self.coordinator = AppCoordinator(navigationController: navController)
        self.coordinator?.start()
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }

  
}

