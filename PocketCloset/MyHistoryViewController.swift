//
//  MyHistoryViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/13/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit

class MyHistoryViewController: UIViewController {
    
    let mainMenuSegueIdentifier = "mainMenuSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pressedMainMenu(sender: AnyObject) {
        performSegueWithIdentifier(mainMenuSegueIdentifier, sender: self)
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
