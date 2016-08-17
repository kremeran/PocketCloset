//
//  LoginViewController.swift
//  PocketCloset
//
//  Created by Anirudh on 8/15/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class LoginViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var googleSignIn: GIDSignInButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //GIDSignIn.sharedInstance().uiDelegate = self
        //googleSignIn.style = .Wide
        
        GIDSignIn.sharedInstance().uiDelegate = self
       googleSignIn.style = .Wide
        prepareView()
    }
    
    func prepareView() {
        
        
        // Email / Password
        
        
        
        // Google OAuth
        
        
    }
    
    @IBAction func pressedSignUp(sender: AnyObject) {
        self.handleEmailPasswordSignUp()
    }
    
    @IBAction func pressedLogin(sender: AnyObject) {
        self.handleEmailPasswordLogin()
    }
    
    
    // MARK: - Login Methods
    func loginCompletionCallback(user: FIRUser?, error: NSError?) {
        if error == nil {
            self.appDelegate.handleLogin()
        } else {
            let alertController = UIAlertController(title: "Login failed", message: error?.localizedDescription, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
            print(error?.localizedDescription)
            print(error?.description)
        }
    }
    
    func handleEmailPasswordSignUp() {
        FIRAuth.auth()?.createUserWithEmail(emailtextField.text!, password: passwordTextField.text!, completion: loginCompletionCallback)
    }
    
    
    func handleEmailPasswordLogin() {
        FIRAuth.auth()?.signInWithEmail(emailtextField.text!, password: passwordTextField.text!, completion: loginCompletionCallback)}
}


 


