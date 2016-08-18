//
//  NewOutfitViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/14/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase
class NewOutfitViewController: UIViewController{
    
    //@IBOutlet weak var outfitTableView: UITableView!
    let outfitCell = "outfitCell"
    let mainMenuSegueIdentifier = "pressedMainMenuIdentifier"
    var currentUserArticlesRef : FIRDatabaseReference!
    var currentOutfit = [Article]()
    var articleRef : FIRDatabaseReference!

    @IBOutlet weak var topImageV: UIImageView!
    
    @IBOutlet weak var middleImageV: UIImageView!
    
    @IBOutlet weak var bottomImageV: UIImageView!

    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
            
            
         print(currentOutfit.count)
        print("This is what")
            
            
      
    }

    @IBAction func pressedMainMenu(sender: AnyObject) {
        performSegueWithIdentifier(mainMenuSegueIdentifier, sender: self)
    }
//    func setupFirebaseObservers() {
//        
//        articlesRef.observeEventType(.ChildAdded) { snapshot in self.photoAdded(snapshot) }
//        articlesRef.observeEventType(.ChildChanged) { snapshot in self.photoChanged(snapshot) }
//        articlesRef.observeEventType(.ChildRemoved) { snapshot in self.photoRemoved(snapshot) }
//    }
//    
//    func photoAdded(data : FIRDataSnapshot) {
//        let article = Article(snapshot: data)
//        if clothingTitle == article.type {
//            articles.insert(article, atIndex: 0)
//        }
//        
//        tableView.reloadData()
//    }
//    
//    func photoRemoved(data : FIRDataSnapshot) {
//        var indexToRemove : Int!
//        let articleToDelete = Article(snapshot: data)
//        for (i, article) in articles.enumerate() {
//            if article.key == articleToDelete.key {
//                indexToRemove = i
//                self.articles.removeAtIndex(indexToRemove)
//                break
//            }
//        }
//        tableView.reloadData()
//        
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        articlesRef.removeAllObservers()
//    }
//    
//    func photoChanged(data : FIRDataSnapshot) {
//        let modifiedArticle = Article(snapshot: data)
//        for (i, article) in articles.enumerate() {
//            if article.key == modifiedArticle.key {
//                article.imageURL = modifiedArticle.imageURL
//                article.title = modifiedArticle.title
//                article.type = modifiedArticle.type
//                article.key = modifiedArticle.key
//                break
//            }
//        }
//        tableView.reloadData()
//    }
//
//
//    
//    
//    
    
    
    

    }

    
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


