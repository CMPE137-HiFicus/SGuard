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
    private var Username:String
    private var Request:Any
    private var Notification:Any
    private var Friendlist:Any
    init(Username:String) {
        self.Username = Username
        Request = ""
        Notification = ""
        Friendlist = ""
    }
    
    func getUserInformation(){
       
    }
    
}
