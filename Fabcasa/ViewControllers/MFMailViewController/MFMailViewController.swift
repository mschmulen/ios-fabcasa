//
//  MFMailViewController.swift
//  fabcasa-swift
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class MFMailViewController: UIViewController {

    @IBAction func actionDismiss(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
            println("dismiss")
        })
        
    }
    
    @IBAction func actionCompose(sender: AnyObject) {
        println("compose")
        
        /*
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
        self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
        self.showSendMailErrorAlert()
        }
        */
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func configuredMailComposeViewController() -> MFMailComposeViewController {
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
    mailComposerVC.setToRecipients(["someone@somewhere.com"])
    mailComposerVC.setSubject("Sending you an in-app e-mail...")
    mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
    
    return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
    sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
    controller.dismissViewControllerAnimated(true, completion: nil)
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
