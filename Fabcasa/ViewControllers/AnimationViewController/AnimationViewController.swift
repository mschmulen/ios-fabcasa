//
//  AnimationViewController.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

// reference article http://www.andrewcbancroft.com/2014/09/24/slide-in-animation-in-swift/

class AnimationViewController: UIViewController {

    @IBOutlet weak var slidingTextLabel: UILabel!
    
    @IBAction func slideTextButtonTapped(sender: UIButton) {
        self.slidingTextLabel.slideInFromLeft()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("Animation stopped")
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
