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
import Material



class LoginViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var emailPasswordCard: CardView!
    @IBOutlet weak var googleSignIn: GIDSignInButton!
   // @IBOutlet weak var googleButton: UIView!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var emailPasswordCardContent: UIView!
    @IBOutlet weak var emailtextField: TextField!
    

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
        prepareEmailPasswordCard()
        
        
        
        // Google OAuth
        
        
    }
    
    
    func prepareEmailPasswordCard() {
        emailPasswordCard.contentView = emailPasswordCardContent
        
        emailtextField.placeholder = "Email"
        emailtextField.enableClearIconButton = true
        emailtextField.placeholderActiveColor = MaterialColor.grey.darken2
        
        passwordTextField.placeholder = "Password"
        passwordTextField.clearButtonMode = .WhileEditing
        passwordTextField.enableVisibilityIconButton = true
        passwordTextField.placeholderActiveColor = MaterialColor.grey.darken2
        
        let signUpBtn: FlatButton = FlatButton()
        signUpBtn.pulseColor = MaterialColor.blue.lighten1
        signUpBtn.setTitle("Sign up", forState: .Normal)
        signUpBtn.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
        signUpBtn.addTarget(self, action: #selector(LoginViewController.handleEmailPasswordSignUp),
                            forControlEvents: .TouchUpInside)
        emailPasswordCard.leftButtons = [signUpBtn]
        
        let loginBtn: FlatButton = FlatButton()
        loginBtn.pulseColor = MaterialColor.blue.lighten1
        loginBtn.setTitle("Login", forState: .Normal)
        loginBtn.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
        loginBtn.addTarget(self, action: #selector(LoginViewController.handleEmailPasswordLogin),
                           forControlEvents: .TouchUpInside)
        emailPasswordCard.rightButtons = [loginBtn]
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


 


