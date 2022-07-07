//
//  HomeViewController.swift
//  salt-apps
//
//  Created by SANDI on 06/07/22.
//

import UIKit
import Sample3
import Auk

class HomeViewController: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData(page: 1, isRefresh: true)
    }
    
    func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorStyle = .none
        
        view.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30083")
        viewHeader.backgroundColor = ColorWithHexaString().ColorWithHexaStrings(hex: "e30083")
    }

    func fetchData(page : Int, isRefresh : Bool) {
        UserVM.sharedInstance.fetchData(page: page, isRefresh: isRefresh) { [weak self] (success, response, isRefresh)  in
            if success {
                self!.tableView.reloadData()
            }
        }
        
    }

}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  UserVM.sharedInstance.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        cell.selectionStyle = .none
        cell.nameLabel.text = UserVM.sharedInstance.dataUser[indexPath.row].first_name
        cell.emailLabel.text = UserVM.sharedInstance.dataUser[indexPath.row].email
        cell.avatar.downloadImage(from: UserVM.sharedInstance.dataUser[indexPath.row].avatar!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
}
