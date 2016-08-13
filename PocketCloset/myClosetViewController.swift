//
//  myClosetViewController.swift
//  PocketCloset
//
//  Created by Anirudh on 8/12/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit

class myClosetViewController: UIViewController {
    
    let returnToMainMenuSegueIdentifier = "returnToMainMenu"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedMainMenu(sender: AnyObject) {
        performSegueWithIdentifier(returnToMainMenuSegueIdentifier, sender: self)
    }
   
    
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // might need to filter data based on which button is clicked. 


}