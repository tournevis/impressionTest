//
//  ViewController.swift
//  pinchTest
//
//  Created by Arthur Robert on 09/11/15.
//  Copyright © 2015  arthur. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurImage: UIImageView!
    var originalImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 10.0
        self.originalImage = self.imageView.image ;
       // self.blurImage = blurImage(15, image: self.originalImage!);
        
        
       // self.blurImage.image = blurImage(10, image: self.originalImage!);
        
      
        //let pagesScrollViewSize = self.scrollView.frame.size
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
                return self.imageView
    }
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.imageView.image = blurImage(10, image: self.originalImage);
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit

        
            print(self.scrollView.zoomScale)
        
           // self.imageView.image = myImage;
            }
    func blurImage(value : Float , image: UIImage) -> UIImage {
        let imageToBlur = CIImage(image: image)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter!.setValue(imageToBlur, forKey: "inputImage")
        blurfilter!.setValue(value, forKey: "inputRadius")
        let resultImage = blurfilter!.valueForKey("outputImage") as! CIImage
        
        return UIImage(CIImage: resultImage)
    }
   

}

