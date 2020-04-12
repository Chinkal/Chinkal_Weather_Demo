//
//  AppDelegate.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let notice = CityRouter.createModule()

        let navigationController = UINavigationController()
        navigationController.viewControllers = [notice]

        /* Setting up the root view-controller as ui-navigation-controller */
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

