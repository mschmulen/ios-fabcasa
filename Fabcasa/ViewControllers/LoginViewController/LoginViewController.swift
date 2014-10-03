//
//  LoginViewController.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/3/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // var myUserData : StructUserData?
    
    @IBAction func actionOpenUserPrefs(sender: AnyObject) {
        println(" action Open User Prefs ")
        
        /*
        var vc: UserProfileViewController = UserProfileViewController(nibName: "UserProfileViewController", bundle: nil)
        
        vc.myUserData = self.myUserData
        
        //self.showViewController(vc as UIViewController, sender: vc)
        //self.showDetailViewController( vc as UIViewController, sender: vc )
        
        self.presentViewController(vc as UIViewController, animated: true) { () -> Void in
            println("present done ")
        }
        */
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.myUserData = StructUserData(Name:"Matt", Email:"matt.schmulen@gmail.com")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
