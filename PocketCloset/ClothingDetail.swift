//
//  ClothingDetail.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/17/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase

class ClothingDetail: UIViewController {
    
    var articleRef : FIRDatabaseReference!
    var currentUserRef : FIRDatabaseReference!
    var detailItem : Article?
    let myClosetSegueIdentifier = "showMyCloset"
    var myOutfit = [Article]()
    let customOutfitSegue = "customOutfit"
    var outFitRef : FIRDatabaseReference!

    
    @IBOutlet weak var articleType: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBAction func pressedBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupFirebaseObservers() {
        let firebaseRef = FIRDatabase.database().reference()
        let curentUsersUid = FIRAuth.auth()!.currentUser!.uid
        currentUserRef = firebaseRef.child("users").child(curentUsersUid)
//        articleRef = currentUserRef.child("articles")
        outFitRef = currentUserRef.child("outfits")
        
//        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.photoLabel {
//                label.text = detail.photoLabel
//            }
//        }
//        if let imgString = detailItem?.imageURL {
//            if let imgURL = NSURL(string: imgString) {
//                if let imgData = NSData(contentsOfURL: imgURL) {
//                    imageView.image = UIImage(data: imgData)
//                } else {
//                    print("No data for \(imgString)")
//                }
//            }
//        }
    }
    
    @IBAction func pressedEdit(sender: AnyObject) {
        let createListDialog = UIAlertController(title: "Edit image info " , message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        createListDialog.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = self.detailItem?.title
        }
        createListDialog.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = self.detailItem?.type
        }
        let okAction = UIAlertAction(title: "Change", style: .Default) { (action) in
            
            let textTitle = createListDialog.textFields?.first?.text
            let textType = createListDialog.textFields![1].text
            let imageURL = self.detailItem?.imageURL
            let edited =  Article(imageURL: imageURL!, title: textTitle!, type: textType!)
            self.currentUserRef.childByAutoId().setValue(edited.getSnapshotValue())
            self.currentUserRef.child(self.detailItem!.key!).removeValue()
            
            // self.articlesRef.childByAutoId().setValue(detailItem.getSnapshotValue())
            
       // self.articleRef.child(self.detailItem!.key).updateChildValues((self.detailItem?.getSnapshotValue())! as [NSObject : AnyObject])
//            self.articleLabel.text = editedArticle.title
//            self.articleType.text = editedArticle.type
            self.returnToMyCloset()
            
            
            
        }
        let cancelAction = UIAlertAction(title: "Keep", style: .Default, handler: nil)
        createListDialog.addAction(cancelAction)
        createListDialog.addAction(okAction)
        self.presentViewController(createListDialog, animated: true, completion: nil)
  

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        articleRef!.observeEventType(FIRDataEventType.Value) { (snapshot: FIRDataSnapshot) in
            if !snapshot.exists() {
                print("snapshot doesent exists")
                return
            }
            
            self.detailItem = Article(snapshot: snapshot)
            self.articleLabel.text = self.detailItem?.title
            self.articleType.text = self.detailItem?.type
            if let imgString = self.detailItem?.imageURL {
                if let imgURL = NSURL(string: imgString) {
                    if let imgData = NSData(contentsOfURL: imgURL) {
                        self.imageDisplay.image = UIImage(data: imgData)
                    } else {
                        print("No data for \(imgString)")
                    }
                }
            }
        }
    }
    func returnToMyCloset() {
            performSegueWithIdentifier(myClosetSegueIdentifier, sender: self)
        }
    @IBAction func pressedAddToOutfit(sender: AnyObject) {
        self.myOutfit.insert(self.detailItem!, atIndex: 0);
        print(detailItem?.title)
        print("is added")
       
        
    }
        
  

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == customOutfitSegue {
            let controller = segue.destinationViewController as! NewOutfitViewController
            controller.currentOutfit = self.myOutfit
            
            //controller.articleRef = self.articleRef
        }

    }
 

}
