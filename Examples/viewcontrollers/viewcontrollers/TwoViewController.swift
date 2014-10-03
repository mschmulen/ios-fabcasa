//
//  TwoViewController.swift
//  viewcontrollers
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

protocol TwoVCDelegate{
    func didFinishTwoVC(controller:TwoViewController)
}

class TwoViewController: UIViewController {

    var vcCount:Int = 0
    var delegate:TwoVCDelegate!=nil
    
    @IBAction func actionBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func actionNext(sender: AnyObject) {
        
        let vc = ThreeViewController( nibName: "ThreeViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(vcCount) ")
        
        navigationItem.title = "Count: \(vcCount)"
        
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
