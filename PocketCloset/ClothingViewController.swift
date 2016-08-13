//
//  ClothingViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/13/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController {
    let backIdentifier = "backToMyClosetSegueIdentifier"
    
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var clothingTableView: UITableView!
    
    var clothingTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTitle.text = clothingTitle
        // Do any additional setup after loading the view.
    }
    @IBAction func pressedBackButton(sender: AnyObject) {
        performSegueWithIdentifier(backIdentifier, sender: self)
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
