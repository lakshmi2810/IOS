//
//  RootVC.swift
//  MupparajuAlbumApp
//
//  Created by Mupparaju,Lakshmi on 3/29/23.
//

import UIKit

class RootVC: UIViewController {
    
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var loginBTN: UIButton!
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userNameTF.text = ""
        self.passwordTF.text = ""
        self.passwordTF.isEnabled = false
        self.loginBTN.isEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pwdEnable(_ sender: UITextField) {
        guard let content = self.userNameTF.text,!content.isEmpty, content == "admin" else {return}
        AppConstants.username = content
        self.passwordTF.isEnabled = true
    }
    
    @IBAction func loginBTNEnbled(_ sender: UITextField) {
        guard let  content = self.passwordTF.text,!content.isEmpty,content == "password" else {return}
        self.loginBTN.isEnabled = true
    }

    
    @IBAction func loginBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showAlbum", sender: sender)
    }
    
}
