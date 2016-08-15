//
//  Section.swift
//  PocketCloset
//
//  Created by Anirudh on 8/16/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import Foundation

struct Section {
    var heading: String
    var items : [String]


init(title:String, objects:[String]){
    self.heading = title
    self.items = objects
    
    }
}