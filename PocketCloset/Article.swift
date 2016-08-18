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
    
    let photoURLKey = "photoURL"
    let titleKey = "title"
    
    init(imageURL: String, title: String) {
        self.title = title
        self.imageURL = imageURL
    }
    
    init(snapshot: FIRDataSnapshot) {
        self.key = snapshot.key
        print(snapshot.value)
        self.imageURL = snapshot.value![self.photoURLKey]! as? String
        self.title = snapshot.value![self.titleKey]! as? String
    }
    
    func getSnapshotValue() -> NSDictionary {
        return ["title":self.title!, "photoURL":self.imageURL!]
    }

}
