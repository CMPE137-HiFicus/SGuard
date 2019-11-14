//
//  User.swift
//  SGuard
//
//  Created by Kham Tran on 11/6/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import Foundation
import FirebaseFirestore
class User{
    private var ref = Firestore.firestore()
    private var username:String = ""
    private var Request:NSArray = []
    private var Notification:NSArray = []
    private var Friendlist:NSArray = []
    init(Username:String) {
        
        self.ref.collection("user").document(Username ).addSnapshotListener{
            (documentSnapshot , error)  in
            guard let doc = documentSnapshot else {
            print("Error fetching document: \(error!)")
            return
            }
            self.username = doc.get("username") as! String
            self.Request = doc.get("Request") as! NSArray
            
            self.Notification = doc.get("Notification") as! NSArray
            
        }
        
    }

}
