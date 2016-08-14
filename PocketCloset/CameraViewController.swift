//
//  CameraViewController.swift
//  PocketCloset
//
//  Created by Amy Kremer on 8/14/16.
//  Copyright © 2016 Rose-Hulman. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    let returnToMainMenuSegueIdentifier = "returnToMainMenu"
    
    @IBAction func pressedBack(sender: AnyObject) {
        performSegueWithIdentifier(returnToMainMenuSegueIdentifier, sender: self)
    }
    
    @IBOutlet weak var cameraView: UIView!
    let captureSession = AVCaptureSession()
    var captureDevice : AVCaptureDevice?

    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        let devices = AVCaptureDevice.devices()
        print(devices)
        for device in devices {
            print(device)
            if (device.hasMediaType(AVMediaTypeVideo)) {
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        if captureDevice != nil {
            beginSession()
            print("began session\n\n\n\n")
        } else {
            print("error didnt begin session")
        }
        // Do any additional setup after loading the view.
    }
    
    func beginSession() {
        do {
            try self.captureSession.addInput(AVCaptureDeviceInput(device: self.captureDevice))
        } catch {
            
        }
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraView.layer.addSublayer(previewLayer)
        previewLayer?.frame = cameraView.layer.frame
        captureSession.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
