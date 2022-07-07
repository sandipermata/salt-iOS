//
//  HomeViewController.swift
//  salt-apps
//
//  Created by SANDI on 06/07/22.
//


import UIKit
import Sample3

class TabMainViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.showTitleTabBar()
        self.delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
    
    func showTitleTabBar() {
        let selectedColor   = ColorWithHexaString().ColorWithHexaStrings(hex: "6A9ED8")
        let unselectedColor = ColorWithHexaString().ColorWithHexaStrings(hex: "949494")

        // Create Tab Home
        let tabHome = HomeViewController()
        let tabHomeBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeoff")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "homeon")?.withRenderingMode(.alwaysOriginal))
        tabHomeBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        tabHomeBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        tabHome.tabBarItem = tabHomeBarItem
        
        // Create Tab Setting
        let tabSetting = SettingViewController()
        let tabSettingBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "settingoff")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "settingon")?.withRenderingMode(.alwaysOriginal))
        tabSettingBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        tabSettingBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        tabSetting.tabBarItem = tabSettingBarItem
        
        UITabBar.appearance().tintColor = ColorWithHexaString().ColorWithHexaStrings(hex: "ffffff")
//        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        
        self.viewControllers = [tabHome, tabSetting]
    }
    
    @objc func leftBarButtonItemAction_Cross(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
    
}
