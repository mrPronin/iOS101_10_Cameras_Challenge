//
//  ViewController.swift
//  PickersAndCameras
//
//  Created by Brian on 9/1/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Vars
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func pickFromCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .Camera
            picker.cameraDevice = .Front
            picker.cameraCaptureMode = .Photo
            picker.cameraFlashMode = .Off
            picker.showsCameraControls = true
            picker.modalPresentationStyle = .FormSheet
            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveImage(sender:AnyObject) {
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    @IBAction func pickFromCameraRoll(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .PhotoLibrary
//        picker.modalPresentationStyle = .FullScreen
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func makeNostalgic(sender: AnyObject) {
        
        let beginImage = CIImage(image: imageView.image!)
        if let filter = CIFilter(name: "CISepiaTone") {
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            filter.setValue(0.8, forKey: kCIInputIntensityKey)
            if let outputImage = filter.outputImage {
                let ciContext = CIContext(options: nil)
                let cgImageRef = ciContext.createCGImage(outputImage, fromRect:outputImage.extent)
                let newImage = UIImage(CGImage: cgImageRef)
                imageView.image = newImage
            }
        }
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            imageView.image = image as? UIImage
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}


