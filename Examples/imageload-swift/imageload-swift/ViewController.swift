//
//  ViewController.swift
//  imageload-swift
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func actionLoad(sender: AnyObject) {
        println( "action load")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageFromURLBlocking()
    {
        var url = NSURL.URLWithString(textField.text)
        var data = NSData( contentsOfURL: url)
        var image = UIImage( data: data )
        println( " image size \(image.size)")
    }
    


}

