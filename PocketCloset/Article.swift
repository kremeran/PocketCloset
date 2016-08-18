//
//  Article.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/17/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase

class Article: NSObject {
    
    var key: String?
    var imageURL: String?
    var title: String?
    var type : String?
    
    let photoURLKey = "photoURL"
    let titleKey = "title"
    let typeKey = "type"
    
    init(imageURL: String, title: String, type:String) {
        self.title = title
        self.imageURL = imageURL
        self.type = type
    }
    
    init(snapshot: FIRDataSnapshot) {
        self.key = snapshot.key
        print(snapshot.value)
        self.imageURL = snapshot.value![self.photoURLKey]! as? String
        self.title = snapshot.value![self.titleKey]! as? String
        self.type = snapshot.value![self.typeKey]! as? String
        print("Just got the photo: \(title) from \(imageURL). \(type)")
    }
    
    func getSnapshotValue() -> NSDictionary {
        return [titleKey:self.title!, photoURLKey:self.imageURL!, typeKey: self.type!]
        
    }

}
