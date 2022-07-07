//
//  AppDelegate.swift
//  salt-apps
//
//  Created by SANDI on 06/07/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeVc = LaunchScreenViewController()
        let navigationController = UINavigationController(rootViewController: homeVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }



}

