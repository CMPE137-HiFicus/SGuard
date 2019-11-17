//
//  Profile.swift
//  SGuard
//
//  Created by Kham Tran on 11/3/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseFirestore
class Profile: UIViewController {
    @IBOutlet weak var Username: UILabel!
    private var ref = Firestore.firestore()
//    private var user = User(Username: "khamtran")
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.text = user.getUsername()
        self.ref.collection("user").document("GraceTo").addSnapshotListener { doc , error in
            guard let document = doc else{
                print("Error fleching data: \(error!)")
                return
            }
            self.Username.text = document.get("Username") as! String?	
            }
        }
    

}
