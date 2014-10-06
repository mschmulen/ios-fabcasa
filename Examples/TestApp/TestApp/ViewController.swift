//
//  ViewController.swift
//  TestApp
//
//  Created by Matt Schmulen on 10/6/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vc:UIViewController?
    
    @IBAction func showMessaging(sender: AnyObject) {
        
        vc = MessagingViewController(nibName: "MessagingViewController", bundle: nil)
        //vc.myUserData = self.myUserData
        //self.showViewController(vc as UIViewController, sender: vc)
        //self.showDetailViewController( vc as UIViewController, sender: vc )
        self.addCloseToViewController(vc!)
        self.presentViewController(vc!, animated: true) { () -> Void in
            println("yack")
        }
    }
    
    @IBAction func showLogin(sender: AnyObject) {
        vc = LoginViewController(nibName: "MessagingViewController", bundle: nil)
        self.addCloseToViewController(vc!)
        self.presentViewController(vc!, animated: true) { () -> Void in
            println("yack")
        }
    }
    
    @IBAction func showGeneric(sender: AnyObject) {
        vc = LoginViewController(nibName: "MessagingViewController", bundle: nil)
         self.addCloseToViewController(vc!)
        self.presentViewController(vc!, animated: true) { () -> Void in
            println("yack")
        }
    }
    
    @IBAction func actionChildClose(sender: AnyObject) {
       vc?.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("so long view controller ")
        })
    }
    
    func addCloseToViewController( vc:UIViewController )
    {
        let closeButton:UIButton = UIButton(frame: CGRectMake(0, 0, 200, 50))
        closeButton.titleLabel?.text = "CLOSE"
//        closeButton.titleLabel?.font.colo
        //closeButton.frame = CGRectMake(100, 100, 100, 100)
        //buttonObject.tag = 200 // Setting the tag for the button
        //[button setContentEdgeInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
        //[button sizeToFit];
        //button.center = CGPointMake(200, 50);

        closeButton.backgroundColor = UIColor.darkGrayColor() // Setting the background color for the button
        closeButton.setTitle("CLOSE", forState: UIControlState.Normal) // Setting the button title for normal state
        closeButton.setTitle("CLOSE", forState: UIControlState.Highlighted) // Setting the button title for highlighted state
        
        //closeButton(IMAGE, forState: UIControlState.Normal)
        //closeButton.addTarget(self, action: "btnTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        closeButton.addTarget(self, action: "actionChildClose:", forControlEvents:UIControlEvents.TouchUpInside)
        
        vc.view.addSubview(closeButton)
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

