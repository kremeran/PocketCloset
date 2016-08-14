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
    let showCategoryIdentifier = "showCategoryIdentifier"
    
    var categoryTitle : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedTops(sender: AnyObject) {
        categoryTitle = "Tops"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    @IBAction func pressedAccessories(sender: AnyObject) {
        categoryTitle = "Accessories"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    @IBAction func pressedFootwear(sender: AnyObject) {
        categoryTitle = "Footwear"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    @IBAction func pressedBottoms(sender: AnyObject) {
        categoryTitle = "Bottoms"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    @IBAction func pressedFormal(sender: AnyObject) {
        categoryTitle = "Formal"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    @IBAction func pressedSwimwear(sender: AnyObject) {
        categoryTitle = "Swimwear"
        performSegueWithIdentifier(showCategoryIdentifier, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == showCategoryIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = categoryTitle
        }
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