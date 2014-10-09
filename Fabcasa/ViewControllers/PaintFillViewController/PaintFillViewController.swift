//
//  PaintFillViewController.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class PaintFillViewController: UIViewController {
    
    @IBAction func actionResetCanvas(sender: AnyObject) {
        
    }
    
    @IBAction func actionSetColorBlue(sender: AnyObject) {
    }
    @IBAction func actionSetColorRed(sender: AnyObject) {
    }
    @IBOutlet weak var actionSetColorBrown: UIButton!
    
    @IBOutlet weak var canvas: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
