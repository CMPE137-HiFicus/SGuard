//
//  ViewController.swift
//  SGuard
//
//  Created by Kham Tran on 10/27/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class HomePage: UIViewController {
    static var name:String = ""
    private let currentUser = Auth.auth()
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var login: UIButton!
     private var Domain = "@SGuard.com"
    var ref:DatabaseReference = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener{user,error in}
        UI_Util.setGradientGreenBlue(uiView: self.view)
    
    }
    func segueLink(){
            HomePage.name = email.text!
            performSegue(withIdentifier: "home", sender: self)
    }
    @IBAction func login(_ sender: Any) {
       let user = email.text
        let pass = password.text!
        if user!.isEmpty || pass.isEmpty{
            self.status.text = "user/pass can be empty"

        }
        else {
        let fullEmail = user! + Domain
        
            self.currentUser.signIn(withEmail: fullEmail, password: pass) {authresult ,error in
            if let e = error{
                self.status.text = "login fail"
            }
            else {
                self.status.text = "Login success"

                self.segueLink()
               
              }
            }
        }
        
    }
    @IBAction func logout(_ sender: Any) {
        do { try self.currentUser.signOut()}
        catch let signoutError as NSError{
            print("Error signing out", signoutError)
        }
    }
    
    
    @IBSegueAction func swipre(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> UIViewController? {
        return UIViewController(coder: coder)
    }
    
   
    @IBAction func SwipeUp(_ sender: UISwipeGestureRecognizer) {
//        sender.direction = UISwipeGestureRecognizer.Direction.down
        
        	
    }
    
}

