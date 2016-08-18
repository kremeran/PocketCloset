//
//  Outfit.swift
//  PocketCloset
//
//  Created by Anirudh on 8/18/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase

class Outfit: NSObject {

   
    
    class Outfits: NSObject {
        
        var key: String?
        var imageURLtop: String?
        var imageURLbottom: String?
        var imageURLfeet : String?
        
        let topKey = "top"
        let bottomKey = "bottom"
        let feetKey = "feet"
        
        init(imageURLtop: String, imageURLbottom: String, imageURLfeet:String) {
            self.imageURLtop = imageURLtop
            self.imageURLbottom = imageURLbottom
            self.imageURLfeet = imageURLfeet
        }
        
        init(snapshot: FIRDataSnapshot) {
            self.key = snapshot.key
            print(snapshot.value)
            self.imageURLtop = snapshot.value![self.topKey]! as? String
            self.imageURLbottom = snapshot.value![self.bottomKey]! as? String
             self.imageURLfeet = snapshot.value![self.feetKey]! as? String
            //print("Just got the photo: \(title) from \(imageURL). \(type)")
        }
        
        func getSnapshotValue() -> NSDictionary {
            return [topKey:self.imageURLtop!, bottomKey: self.imageURLbottom!, feetKey : self.imageURLfeet!]
            
        }
        
    }

}
