//
//  SocialViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/14/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    
    let showMainMenuSegueIdentifier =
        "mainMenuSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func pressedMainMenu(sender: AnyObject) {
        performSegueWithIdentifier(showMainMenuSegueIdentifier, sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
