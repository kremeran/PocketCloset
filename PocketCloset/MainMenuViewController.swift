//
//  MainMenuViewController.swift
//  PocketCloset
//
//  Created by Anirudh on 8/11/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    let myClosetSegueIdentifier = "showMyCloset"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    // will need to create 4 different segues to toggle through views
    // also a navigation controller will need to be embedded in so that we can go back to this menu
 //
    
    

    @IBAction func myClosetPressed(sender: AnyObject) {
        performSegueWithIdentifier(myClosetSegueIdentifier, sender: self)
    }
    
    
    /*
     @IBOutlet weak var MyHistoryPressed: UIButton!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
