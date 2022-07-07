//
//  errorViewController.swift
//  podGeneralSJI
//
//  Created by adriansalim on 11/05/20.
//  Copyright © 2020 adriansalim. All rights reserved.
//

import UIKit

class errorViewController: UIViewController {
    
    @IBOutlet weak var imageClose: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var imageError: UIImageView!
    
    @IBOutlet weak var titleError: UILabel!
    @IBOutlet weak var subTitleError: UILabel!
    
    @IBOutlet weak var labelButton: UILabel!
    @IBOutlet weak var btnReload: UIButton!
    
    //Passing data
    public var imageClosePass : UIImage?
    public var btnCloseHidePass : Bool?
    
    public var imageErrorPass : UIImage?
    public var titleErrorPass : String?
    public var subTitleErrorPass : String?
    
    public var labelButtonPass : String?
    public var btnReloadHidePass : Bool?
    public var btnReloadColorPass : UIColor?
    
    public var statusCodePass : String?
    public var methodCallPass : String?
    public var nameViewControllerPass : UIViewController?
    public var isDefaultUIActivePass : Bool?
    
    public override init(nibName: String?, bundle: Bundle?){
        super.init(nibName: nibName, bundle: bundle)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if(isDefaultUIActivePass == false){
            self.customUI()
        }
        else{
            self.defaultUI()
        }
    }
    
    func customUI(){
        if(self.btnCloseHidePass == false){
            if((self.imageClosePass) != nil){
                self.imageClose.image = self.imageClosePass!
                self.btnClose.isHidden = false
                self.imageClose.isHidden = false
            }
            else{
                self.btnClose.isHidden = true
                self.imageClose.isHidden = true
            }
        }
        else{
            self.btnClose.isHidden = true
            self.imageClose.isHidden = true
        }
        
        self.imageError.image = self.imageErrorPass!
        self.titleError.text = self.titleErrorPass!
        self.subTitleError.text = self.subTitleErrorPass!
        
        
        if(self.btnReloadHidePass == false){
            if((self.labelButtonPass) != nil && (self.btnReloadColorPass) != nil){
                self.labelButton.text = self.labelButtonPass!
                self.btnReload.backgroundColor = self.btnReloadColorPass
                self.labelButton.isHidden = false
                self.btnReload.isHidden = false
            }
            else{
                self.labelButton.isHidden = true
                self.btnReload.isHidden = true
            }
        }
        else{
            self.labelButton.isHidden = true
            self.btnReload.isHidden = true
        }
    }
    
    func defaultUI(){
        
    }
    
    func dismissMethod(){
        if(self.methodCallPass?.lowercased() == "push"){
            if((self.nameViewControllerPass) != nil){
                self.navigationController?.popToViewController(self.nameViewControllerPass!, animated: true)
            }
            else{
                self.navigationController?.popViewController(animated: true)
            }
        }
        else{
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func btnReload(_ sender: Any) {
        self.dismissMethod()
    }
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismissMethod()
    }
    
    /*
     How to call .XIB
     
     let bundle = Bundle(for: errorViewController.classForCoder())
     let vc = errorViewController.init(nibName: "errorViewController", bundle: bundle)
     vc2.titleErrorPassing = "title"
     navigationController?.pushViewController(vc, animated: true)
     
     */
    

}
