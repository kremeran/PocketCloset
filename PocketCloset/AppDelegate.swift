//
//  AppDelegate.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/10/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, GIDSignInDelegate {

    var window: UIWindow?

    func application(application: UIApplication,
                     openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        return GIDSignIn.sharedInstance().handleURL(url,
                                                    sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String,
                                                    annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
    }

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let showLoginScreen = FIRAuth.auth()?.currentUser == nil
        if showLoginScreen {
            showLoginViewController();
        } else {
            showMainMenuViewController()
        }
        window?.makeKeyAndVisible()
        
       
//        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self

        return true
    }


    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "edu.rosehulman.kremeran.PocketCloset" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("PocketCloset", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    
    func handleLogin() {
        showMainMenuViewController()
    }
    
    func handleLogout() {
        GIDSignIn.sharedInstance().signOut()
        try!FIRAuth.auth()?.signOut()
        showLoginViewController()
    }
    
    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window!.rootViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
        print("Showing Login View Controller")
    }
    
    func showMainMenuViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let photoBucketTableViewController = storyboard.instantiateViewControllerWithIdentifier("MainMenuViewController")
        self.window?.rootViewController = photoBucketTableViewController
        
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken,
                                                                     accessToken: authentication.accessToken)
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil{
                print("Error with google Auth")
                print(error?.localizedDescription)
                return
            }
            self.handleLogin()
        })
        print("Signed in through GOOGLE")
        // ...
    }

    

}

extension UIViewController {
        var appDelegate : AppDelegate {
            get {
                return UIApplication.sharedApplication().delegate as! AppDelegate
            }
        }
    }
    




