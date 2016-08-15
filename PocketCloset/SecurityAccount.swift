//
//  SecurityAccount.swift
//  PocketCloset
//
//  Created by Anirudh on 8/16/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase


class SecurityAccount: NSObject {
    
    var name: String?
    var email : String!
    var key :String?
    var password : String!
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        
        
    }
    init(snapshot: FIRDataSnapshot) {
        self.key = snapshot.key
        self.email = snapshot.value!["email"] as! String
        self.password = snapshot.value!["password"] as! String
        print("Just got the photo: \(email) and \(password). \(key)\"")
    }
    
    func getSnapshot() -> NSDictionary{
        
        return ["email": self.email, "password": self.password!]
    }
    


}
