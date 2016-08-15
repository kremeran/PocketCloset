//
//  SectionsData.swift
//  PocketCloset
//
//  Created by Anirudh on 8/16/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import Foundation
class SectionsData {
    func getSectionsFromData() -> [Section] {
        var sectionsArray = [Section]()
        let myAcc = Section(title: "My Account", objects: ["Name","Birthday","Mobile Number","E-mail","Password","Notifications"])
        let accActions = Section(title: "Account Actions", objects: ["Clear All Outfits","Clear All Data","LOG OUT"])
        
        sectionsArray.append(myAcc)
        sectionsArray.append(accActions)
        
        return sectionsArray
    }
}
