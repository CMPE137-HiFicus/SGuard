//
//  ViewController.swift
//  SGuard
//
//  Created by Kham Tran on 10/27/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var login: UIButton!
     private var Domain = "@SGuard.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener{user,error in}
    }
   
    @IBAction func login(_ sender: Any) {
       let user = email.text
        let pass = password.text!
        if user!.isEmpty || pass.isEmpty{
            self.status.text = "user/pass can be empty"

        }
        else {
        let fullEmail = user! + Domain
        Auth.auth().signIn(withEmail: fullEmail, password: pass) {authresult ,error in
            if let e = error{
                self.status.text = "login fail"
            }
            else {
                self.status.text = "Login success"
            }
            }}
    }
    
}

