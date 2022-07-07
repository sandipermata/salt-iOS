//
//  UserTableViewCell.swift
//  salt-apps
//
//  Created by SANDI on 07/07/22.
//

import UIKit
import Sample3

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameLabel.font = loadFonts.loadFontWithSize(.S14, .OpenSansRegular)
        self.emailLabel.font = loadFonts.loadFontWithSize(.S14, .OpenSansRegular)
        self.avatar.setRounded()
      
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
}
