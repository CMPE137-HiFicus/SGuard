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
    private var Friendlist:CollectionReference
    init(Username:String) {
        
        self.Friendlist = self.ref.collection("user").document(Username ).collection("FriendList")
         self.ref.collection("user").document(Username ).addSnapshotListener{
            (documentSnapshot , error)  in
            guard let doc = documentSnapshot else {
            print("Error fetching document: \(error!)")
            return
            }
            self.username = doc.get("Username") as! String
            self.Request = doc.get("Requests") as! NSArray
            
            self.Notification = doc.get("Notification") as! NSArray
            
        }
    }
    
    
    func getUsername() -> String {
        return self.username
    }
    
    

}
