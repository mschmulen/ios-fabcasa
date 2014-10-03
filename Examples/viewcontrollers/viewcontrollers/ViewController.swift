//
//  ViewController.swift
//  viewcontrollers
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController , TwoVCDelegate {
    
    //var vcCount:Int = 0
    var vcCount:Int = 0{
        didSet{
            navigationItem.title = "Count: \(vcCount)"
        }
    }
    
    func didFinishTwoVC(controller: TwoViewController) {
        self.vcCount = controller.vcCount + 1
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBOutlet weak var fourFiveSwitch: UISwitch!

    @IBAction func actionNext(sender: AnyObject) {
        
        //creates a view controller of class TwoViewController, using the XIB of the same name.
        let vc = TwoViewController(nibName: "TwoViewController", bundle: nil)
        self.vcCount = vcCount + 1
        
        vc.delegate = self
        vc.vcCount = self.vcCount
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func actionFour(sender: AnyObject) {
        
        if fourFiveSwitch.on {
            performSegueWithIdentifier("four", sender: self)
        }else
        {
            performSegueWithIdentifier("five", sender: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

