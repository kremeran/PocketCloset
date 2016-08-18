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
    var detailItem : Article?

    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBAction func pressedBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        articleRef!.observeEventType(FIRDataEventType.Value) { (snapshot: FIRDataSnapshot) in
            if !snapshot.exists() {
                print("snapshot doesent exists")
                return
            }
            
            self.detailItem = Article(snapshot: snapshot)
            self.articleLabel.text = self.detailItem?.title
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
