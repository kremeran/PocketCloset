//
//  info.swift
//  PocketCloset
//
//  Created by Anirudh on 8/18/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase

class info: NSObject {
    var key: String?
    var name: String?
    var number : Int?
    
    let nameKey = "name"
    let numberKey = "number"
    
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
       
    }
    
    init(snapshot: FIRDataSnapshot) {
        self.key = snapshot.key
        print(snapshot.value)
        self.name = snapshot.value![self.nameKey]! as? String
        self.number = snapshot.value![self.numberKey]! as? Int
          }
    
    func getSnapshotValue() -> NSDictionary {
        return [nameKey:self.name!, self.numberKey :self.number!]
        
    }

}
