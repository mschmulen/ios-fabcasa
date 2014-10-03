//
//  TimerViewController.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var labelCurrentTime: UILabel!
    
    var timer = NSTimer()
    var count = 0
    
    @IBAction func actionStart(sender: AnyObject) {
        
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func actionPause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func actionCancel(sender: AnyObject) {
        timer.invalidate()
        count = 0
        labelCurrentTime.text = "0"
        
    }
    
    func result() {
        count++
        labelCurrentTime.text = String(count)
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
