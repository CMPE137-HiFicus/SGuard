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
  

    @IBOutlet weak var label: UILabel!
    private var ref = Firestore.firestore()
//    private var user = User(Username: "khamtran")
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.text = user.getUsername()
        }
        // Do any additional setup after loading the view.
        
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
