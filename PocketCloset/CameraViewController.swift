//
//  CameraViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/14/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class CameraViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    let returnToMainMenuSegueIdentifier = "returnToMainMenu"
    
    @IBOutlet weak var imagePicked: UIImageView!
    
    var editedImage : UIImage?
    @IBOutlet weak var cropView: UIImageView!
    
    @IBAction func pressedBack(sender: AnyObject) {
        performSegueWithIdentifier(returnToMainMenuSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedTakePhoto(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func pressedLibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicked.image = image
        editedImage = image
        imagePicked.backgroundColor = UIColor.darkGrayColor()
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func pressedScaleUp(sender: AnyObject) {
    }
    @IBAction func pressedScaleDown(sender: AnyObject) {
    }
    
    @IBAction func pressedUsePhoto(sender: AnyObject) {
        if editedImage != nil {
            let storageRef = FIRStorage.storage().reference().child("unique title")
            
            //  Every image stored in firebase must have a unique title. The way we will be accessing
            //  it wont require us to store this title, we just need to store the URL. We
            //  could randomly generate 20 digit strings to create random titles or potentially
            //  a different way if you can think of it.
            
            if let uploadData = UIImageJPEGRepresentation(editedImage!, 0.5) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    //  URL of image that was just stored in firebase
                    let photoURL = metadata?.downloadURLs![0]
                })
            }
        }
    }
    

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
        print(cropView.frame.origin.x)
    }
    
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform,
                                                    recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func gestureRecognizer(_: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
        return true
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
