//
//  Register.swift
//  SGuard
//
//  Created by Kham Tran on 10/28/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class Register: UIViewController {
    private let Uid = Auth.auth()
    let db = Firestore.firestore()
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
   
    @IBOutlet weak var labelOf: UILabel!
    private var Domain = "@SGuard.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UI_Util.setGradientGreenBlue(uiView: self.view)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func checkPasswords(pass:String, rePass:String) -> Bool{
    return pass == rePass
    }
    func linkProfile(){
        performSegue(withIdentifier: "linkProfile", sender: self)
    }
    @IBAction func register(_ sender: Any) {
    
        let user = userName.text
        let pass = password.text
        let rePass = rePassword.text
        if user!.isEmpty || pass!.isEmpty || rePass!.isEmpty{
             labelOf.text = "Some field is not filled"
        }
        else {
        if checkPasswords(pass: pass!, rePass: rePass!)
        {   let fullEmail = user! + Domain
           Uid.createUser(withEmail: fullEmail, password: pass!){Authresult, err in
                if let err = err{
                    print("Registing ERROR")
                }
                else{
                    self.Uid.signIn(withEmail: fullEmail, password: pass!){
                        authresult, err in
                        if let err = err{
                            print("ERROR")
                        }
                        else{
                            let doc:[String:Any] = [
                                "Username":user ?? "default",
                                "Requests":[],
                                "Friend list": [],
                                "Notification":[]]
                            
                           	 self.db.collection("user").document(user ?? "default").setData(doc){err in
                                if let err = err {
                                    print("ERRoR")
                                }
                                else{
                                    print("SUCCESS")
                                }
                                    
                            }
                            self.linkProfile()
                        }
                    }
                }
            }
        }
        else {
            labelOf.text = "Passwords are not match"
        }
        }}
 
}
