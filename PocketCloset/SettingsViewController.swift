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
    var currentUserRef : FIRDatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentUserRef = firebaseRef.child("users").child(currentUserUid).child("info")
       
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
                updatePassword()
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
        
        let createListDialog = UIAlertController(title: "Change Password " , message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
      
        createListDialog.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Put in new password"
        }
        createListDialog.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Re-Enter the new password"
        }
        let okAction = UIAlertAction(title: "Change", style: .Default) { (action) in
            
            
            let newPass = createListDialog.textFields![0].text!
            let renewPass = createListDialog.textFields![1].text!
            
            if newPass == renewPass {
                FIRAuth.auth()?.currentUser?.updatePassword(newPass, completion: { (error: NSError?) in
                    if((error) == nil){
                        let passwordChanger = UIAlertController(title: "Password Changed " , message:"Successful", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        self.presentViewController(passwordChanger, animated: true, completion: nil)
                        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(4 * Double(NSEC_PER_SEC)))
                        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                            passwordChanger.dismissViewControllerAnimated(true, completion: nil)
                        })
                        
                    }
                    else{
                        let passwordChanger = UIAlertController(title: "Something went wrong " , message:"Try again", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        self.presentViewController(passwordChanger, animated: true, completion: nil)
                        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(4 * Double(NSEC_PER_SEC)))
                        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                            passwordChanger.dismissViewControllerAnimated(true, completion: nil)
                        })

                    }
                    })
                
            }
        }
        
    
        let cancelAction = UIAlertAction(title: "Keep", style: .Default, handler: nil)
        createListDialog.addAction(cancelAction)
        createListDialog.addAction(okAction)
        self.presentViewController(createListDialog, animated: true, completion: nil)
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


