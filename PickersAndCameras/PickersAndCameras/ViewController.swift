//
//  ViewController.swift
//  PickersAndCameras
//
//  Created by Brian on 9/1/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func pickFromCamera(sender: AnyObject) {
    
  }
  
  @IBAction func saveImage(sender:AnyObject) {
    
  }
  
  @IBAction func pickFromCameraRoll(sender: AnyObject) {
    

    
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

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

  }
}


