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
    override func viewDidLoad() {
        super.viewDidLoad()

        ref.collection("user").document("G1MOvDx6vPTsRjhe7J50iLf1UM03")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                let s = document.get("Friend list")
            
               
        }
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func trigger(_ sender: Any) {
      
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
