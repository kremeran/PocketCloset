//
//  ClothingTableViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/17/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase

class ClothingTableViewController: UITableViewController {
    
    let backSegueIdentifier = "backSegueIdentifier"
    let detailSegueIdentifier = "showDetailSegue"
    
    var articlesRef : FIRDatabaseReference!
    var clothingTitle : String!
    var articles = [Article]()
    var selectedIndex : Int!
    
    
    func pressedBackButton() {
        performSegueWithIdentifier(backSegueIdentifier, sender: self)
    }
    
    func setupFirebaseObservers() {
        
        articlesRef.observeEventType(.ChildAdded) { snapshot in self.photoAdded(snapshot) }
        articlesRef.observeEventType(.ChildChanged) { snapshot in self.photoChanged(snapshot) }
        articlesRef.observeEventType(.ChildRemoved) { snapshot in self.photoRemoved(snapshot) }
    }
    
    func photoAdded(data : FIRDataSnapshot) {
        let article = Article(snapshot: data)
        articles.insert(article, atIndex: 0)
        tableView.reloadData()
    }
    
    func photoRemoved(data : FIRDataSnapshot) {
        var indexToRemove : Int!
        let articleToDelete = Article(snapshot: data)
        for (i, article) in articles.enumerate() {
            if article.key == articleToDelete.key {
                indexToRemove = i
                self.articles.removeAtIndex(indexToRemove)
                break
            }
        }
        tableView.reloadData()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        articlesRef.removeAllObservers()
    }
    
    func photoChanged(data : FIRDataSnapshot) {
        let modifiedArticle = Article(snapshot: data)
        for (i, article) in articles.enumerate() {
            if article.key == modifiedArticle.key {
                article.imageURL = modifiedArticle.imageURL
                article.title = modifiedArticle.title
                article.key = modifiedArticle.key
                break
            }
        }
        tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        articles.removeAll()
        tableView.reloadData()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Done, target: self, action: #selector(self.pressedBackButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .Done, target: self, action: #selector(self.openFilterMenu))
        self.title = clothingTitle
        setupFirebaseObservers()
    }

    func openFilterMenu() {
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let key = articles[indexPath.row].key!
            articlesRef.child(key).removeValue()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == backSegueIdentifier {
            let controller = segue.destinationViewController as! myClosetViewController
            controller.articlesRef = self.articlesRef
        }
        if segue.identifier == detailSegueIdentifier {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = articles[indexPath.row]
                let controller = segue.destinationViewController as! ClothingDetail
                controller.articleRef = self.articlesRef.child(object.key!)
            }
        }
    }
 

}
