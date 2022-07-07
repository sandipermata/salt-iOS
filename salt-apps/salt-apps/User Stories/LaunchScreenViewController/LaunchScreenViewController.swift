//
//  LaunchScreenViewController.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
}
