//
//  LoginViewController.swift
//  wallet
//
//  Created by SANDI on 26/05/20.
//  Copyright © 2020 sji. All rights reserved.
//

import UIKit
import LocalAuthentication
import Sample3

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var showPassBtn: UIButton!
    @IBOutlet weak var helloThereLabel: UILabel!
    @IBOutlet weak var pleaseSignInLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var viewLogin: UIView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        setupView()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.endEditing(true)
    }
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        
        emailField.delegate = self
        passwordField.delegate = self
        emailField.returnKeyType = .done
        passwordField.returnKeyType = .done
        emailField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        
        viewLogin.layer.cornerRadius = 10
        viewLogin.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "f8bcde")
        signInBtn.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30081")
        signInBtn.layer.cornerRadius = 10
    
        pleaseSignInLabel.textColor = ColorWithHexaString().ColorWithHexaStrings(hex: "173A61")
        emailLabel.textColor = ColorWithHexaString().ColorWithHexaStrings(hex: "333333")
        passwordLabel.textColor = ColorWithHexaString().ColorWithHexaStrings(hex: "333333")
        helloThereLabel.textColor =  ColorWithHexaString().ColorWithHexaStrings(hex: "173A61")
        helloThereLabel.font = loadFonts.loadFontWithSize(.S24, .OpenSansBold)
        pleaseSignInLabel.font = loadFonts.loadFontWithSize(.S12, .OpenSansRegular)
        
        emailLabel.font = loadFonts.loadFontWithSize(.S10, .OpenSansRegular)
        passwordLabel.font = loadFonts.loadFontWithSize(.S10, .OpenSansRegular)
      
        signInBtn.titleLabel?.font = loadFonts.loadFontWithSize(.S12, .MontserratRegular)
        emailField.font = loadFonts.loadFontWithSize(.S12, .OpenSansRegular)
        passwordField.font = loadFonts.loadFontWithSize(.S12, .OpenSansRegular)
        passwordField.isSecureTextEntry = true
        
        emailField.layer.cornerRadius = 6
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e20084").cgColor
        
        passwordField.layer.cornerRadius = 6
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e20084").cgColor
    }
    
    @objc
    func login() {
        if (emailField.text?.isValidEmail())! {
            if passwordField.text == "" || passwordField.text!.count <= 4 {
                alertView(title: "Failed", message: "Password minimum 5 characters")
            }
            else {
                apiLogin()
            }
        }
        else {
            alertView(title: "Failed", message: "Email address format is not valid.")
        }
    }
    
    func apiLogin() {
        let params = [
            "email": emailField.text!,
            "password": passwordField.text!
            ] as [String : Any]
        
        apiResult(url: "https://reqres.in/api/login",param: params, method: .post, callback: { (success, response, statusCode) in
            if success {
                guard let data = response else { return }
                do{
                    let decodeData = try JSONDecoder().decode(LoginData.self, from: data as! Data)
                    
                    let homeVc = TabMainViewController()
                    homeVc.selectedViewController = homeVc.viewControllers?[0]
                    self.navigationController?.pushViewController(homeVc, animated: true)
                }
                catch let jsonErr{
                    print(jsonErr)
                }
            }
            else{
                print("Cek Post False")
                self.alertView(title: "Failed", message: "user not found")
            }
        })
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false
            showPassBtn.setImage(UIImage(named: "passHide"), for: .normal)
        }
        else {
            passwordField.isSecureTextEntry = true
            showPassBtn.setImage(UIImage(named: "passShow"), for: .normal)
            
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func alertView(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
