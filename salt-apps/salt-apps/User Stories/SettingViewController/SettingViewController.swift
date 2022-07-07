//
//  SettingViewController.swift
//  salt-apps
//
//  Created by SANDI on 06/07/22.
//

import UIKit
import Sample3

class SettingViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var viewHeader: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(page: 1, isRefresh: true)
        setupView()
    }

    func setupView() {
        title = "Setting"
        view.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30083")
        viewHeader.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30083")
        self.nameLabel.font = loadFonts.loadFontWithSize(.S16, .OpenSansRegular)
        self.emailLabel.font = loadFonts.loadFontWithSize(.S16, .OpenSansRegular)
        self.avatar.layer.cornerRadius = 30
        logoutBtn.titleLabel?.font = loadFonts.loadFontWithSize(.S12, .MontserratRegular)
        logoutBtn.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30083")
        logoutBtn.layer.cornerRadius = 10
    }
    
    func fetchData(page : Int, isRefresh : Bool) {
        ProfileVM.sharedInstance.fetchData(page: page, isRefresh: isRefresh) { [weak self] (success, response, isRefresh)  in
            if success {
                self!.nameLabel.text = ProfileVM.sharedInstance.name
                self!.emailLabel.text = ProfileVM.sharedInstance.email
                self!.avatar.downloadImage(from: (ProfileVM.sharedInstance.avatar))
            }
        }
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
