//
//  registerSchema.swift
//  SGuard
//
//  Created by Kham Tran on 10/28/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import Foundation
import FirebaseDatabase
class registerSchema{
    var ref:DatabaseReference
    init() {
        ref = Database.database().reference()
    }
    
    func checkUser(){
        
    }
}
