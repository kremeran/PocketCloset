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
    let pressedTopsSegueIdentifier = "showTopsSegueIdentifier"
    let pressedBottomsSegueIdentifier = "showBottomsSegueIdentifier"
    let pressedFootwearSegueIdentifier = "showFootwearSegueIdentifier"
    let pressedFormalSegueIdentifier = "showFormalSegueIdentifier"
    let pressedAccessoriesSegueIdentifier = "showAcessoriesSegueIdentifier"
    let pressedSwimwearSegueIdentifier = "showSwimwearSegueIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedTops(sender: AnyObject) {
        performSegueWithIdentifier(pressedTopsSegueIdentifier, sender: self)
    }
    @IBAction func pressedAccessories(sender: AnyObject) {
        performSegueWithIdentifier(pressedAccessoriesSegueIdentifier, sender: self)
    }
    @IBAction func pressedFootwear(sender: AnyObject) {
        performSegueWithIdentifier(pressedFootwearSegueIdentifier, sender: self)
    }
    @IBAction func pressedBottoms(sender: AnyObject) {
        performSegueWithIdentifier(pressedBottomsSegueIdentifier, sender: self)
    }
    @IBAction func pressedFormal(sender: AnyObject) {
        performSegueWithIdentifier(pressedFormalSegueIdentifier, sender: self)
    }
    @IBAction func pressedSwimwear(sender: AnyObject) {
        performSegueWithIdentifier(pressedSwimwearSegueIdentifier, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == pressedTopsSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Tops"
        }
        if segue.identifier == pressedAccessoriesSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Accessories"
        }
        if segue.identifier == pressedFootwearSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Footwear"
        }
        if segue.identifier == pressedBottomsSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Bottoms"
        }
        if segue.identifier == pressedFormalSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Formal"
        }
        if segue.identifier == pressedSwimwearSegueIdentifier {
            let controller = segue.destinationViewController as! ClothingViewController
            controller.clothingTitle = "Swimwear"
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