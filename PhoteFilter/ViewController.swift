//
//  ViewController.swift
//  PhoteFilter
//
//  Created by lizhao on 14-10-9.
//  Copyright (c) 2014年 lizhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    //Create a place to render the filtered image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        //Create an image to filter
        let inputImage = CIImage(image: photoImageView.image)
        
        //Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)))]
        
        //Apply a filter to the image
        let filterImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        //render the filtered image
        let randeredImage = context.createCGImage(filterImage, fromRect: filterImage.extent())
        
        //Reflect the filtered image
        photoImageView.image = UIImage(CGImage: randeredImage)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

