//
//  SettingsViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/13/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SettingsViewController: UITableViewController {
    
    let mainMenuSegueIdentifier = "mainMenuSegueIdentifier"
    var sections: [Section] = SectionsData().getSectionsFromData()
    let sectionCell = "sectionCell"
    let firebaseRef = FIRDatabase.database().reference()
    let currentUserUid = FIRAuth.auth()!.currentUser!.uid
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        // Do any additional setup after loading the view.
    }
    

  
    
    @IBAction func pressedBackButton(sender: AnyObject) {
        performSegueWithIdentifier(mainMenuSegueIdentifier, sender: self)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
 
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //iterate through each item in sections array and call items property
        return sections[section].items.count
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         //iterate through each item in sections array and call heading property
        
        return sections[section].heading
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionCell, forIndexPath: indexPath)
        //config
        //iterate through sections and then iterate through each of those items in our sections to label the rows
        cell.textLabel!.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if let cellID = cell?.textLabel?.text {
            switch cellID {
            case "Name":
                cell?.detailTextLabel?.text = FIRAuth.auth()!.currentUser?.displayName
            case "Birthday":
                print("Clicked Button2")
            case "Mobile Number":
                print("Clicked Button2")
            case "E-mail":
                let email = FIRAuth.auth()!.currentUser?.email
                cell?.detailTextLabel?.text = email
            case "Password":
                print("implement this")
            case "Notifications":
                print("Clicked Button1")
            case "Clear All Outfits":
                print("Clicked Button1")
            case "Clear All Data":
                print("Clicked Button1")
            case "LOG OUT":
                self.appDelegate.handleLogout()
            default:
                print("Something wrong in cellID, please check")
                break
            }
            tableView.reloadData()
        }
            // The values are hardcoded so we can switch with confidence
    }
    func updatePassword() {
        
        
    }
    
    
    
    
    

}


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


