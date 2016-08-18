//
//  MainMenuViewController.swift
//  PocketCloset
//
//  Created by Anirudh on 8/11/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase


class MainMenuViewController: UIViewController {
    let myClosetSegueIdentifier = "showMyCloset"
    let settingsSegueIdentifier = "showSettingsSegue"
    let myOutitsSegueIdentifier = "myOutfitsSegueIdentifier"
    let cameraSegueIdentifier = "showCameraDetailSegue"
    let socialSegueIdentifier = "socialSegueIdentifier"
    let newOutfitSegueIdentifier = "pressedNewOutfitIdentifier"
    
    var currentUserRef : FIRDatabaseReference!
    var articlesRef : FIRDatabaseReference!
    
    var articles = [Article]()
    
    // var currentUserRef : FIRDatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirebaseObservers()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //currentUserRef.removeAllObservers()
    }
    
    func setupFirebaseObservers() {
        let firebaseRef = FIRDatabase.database().reference()
        let curentUsersUid = FIRAuth.auth()!.currentUser!.uid
        currentUserRef = firebaseRef.child("users").child(curentUsersUid)
        articlesRef = currentUserRef.child("articles")
    }
    
    
    @IBAction func pressedNewOutfit(sender: AnyObject) {
        performSegueWithIdentifier(newOutfitSegueIdentifier, sender: self)
    }
    @IBAction func pressedSocial(sender: AnyObject) {
        performSegueWithIdentifier(socialSegueIdentifier, sender: self)
    }
    @IBAction func myClosetPressed(sender: AnyObject) {
        performSegueWithIdentifier(myClosetSegueIdentifier, sender: self)
    }
    @IBAction func pressedMyOutfits(sender: AnyObject) {
        performSegueWithIdentifier(myOutitsSegueIdentifier, sender: self)
    }
    @IBAction func settingsPressed(sender: AnyObject) {
        performSegueWithIdentifier(settingsSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedCamera(sender: AnyObject) {
        performSegueWithIdentifier(cameraSegueIdentifier, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == myClosetSegueIdentifier {
            let controller = segue.destinationViewController as! myClosetViewController
            controller.articlesRef = self.articlesRef
        }
        if segue.identifier == cameraSegueIdentifier {
            let controller = segue.destinationViewController as! CameraViewController
            controller.articlesRef = self.articlesRef
        }
    }
 

}
