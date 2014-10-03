//
//  UserProfileViewController.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/3/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    //var myUserData : StructUserData?
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserEmail: UILabel!
    @IBOutlet weak var labelUserLastLogin: UILabel!
    @IBOutlet weak var imageViewUserPic: UIImageView!
    @IBOutlet weak var buttonClose: UIButton!
    @IBAction func ActionSegmentControlChanged(sender: AnyObject) {
        
        println("action segment control changed")
    }
    
    @IBAction func actionClose(sender: AnyObject) {
        
        self.dismissViewControllerAnimated( true, completion: { () -> Void in
            println("action close")
        })
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
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
    
    // MARK: - Private
    func setup()
    {
        labelUserName.text = "Matt Schmulen"
        labelUserEmail.text = "matt.schmulen@gmail.com"
        labelUserLastLogin.text = "3 days ago"
        
        buttonClose.enabled = false
        
        //// Do any additional setup after loading the view.
        //labelUserName.text = myUserData?.Name
        //labelUserEmail.text = myUserData?.Email
        //labelUserLastLogin.text = "unknown"
        
    }

}
