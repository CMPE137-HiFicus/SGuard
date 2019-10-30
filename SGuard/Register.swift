//
//  Register.swift
//  SGuard
//
//  Created by Kham Tran on 10/28/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseAuth
class Register: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var labelOf: UILabel!
    private var Domain = "@SGuard.com"
    override func viewDidLoad() {
        super.viewDidLoad()
     
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func checkQualify(pass:String, rePass:String) -> Bool{
    return pass == rePass
    }
    @IBAction func register(_ sender: Any) {
         let user = userName.text
        let pass = password.text
        let rePass = rePassword.text
        if user!.isEmpty || pass!.isEmpty || rePass!.isEmpty{
             labelOf.text = "Some field is not filled"
        }
        else {
        if checkQualify(pass: pass!, rePass: rePass!)
        {   let fullEmail = user! + Domain
            Auth.auth().createUser(withEmail: fullEmail, password: pass!)}
        else {
            labelOf.text = "Passwords are not match"
        }
        }}
}
