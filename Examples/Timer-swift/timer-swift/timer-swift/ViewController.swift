//
//  ViewController.swift
//  timer-swift
//
//  Created by Matthew Schmulen on 11/9/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data:UInt64 = 0
    var uiUpdateCount: UInt64 = 0
    var uiUpdateTimer:NSTimer? = nil
    
    var updateInterval:NSTimeInterval = 0.1
    
    //Create a serial queue for synchronized data access
    let dataAccessQueue = dispatch_queue_create("uiUpdateTimerExample.dataAccessQueue", DISPATCH_QUEUE_SERIAL)
    
    func startup()
    {
        // Start an infinite while loop to update our data on a background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            
            // Make sure self is marked as weak so that we don't create a strong reference cycle. See: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-XID_100 Note: self will now be an optional, so could be nil.
            
            [weak self] in
            
            while (true) {
                
                //Use optional chaining to make sure the self.updateData() function can still be called. See: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-XID_361
                
                self?.updateData()
                
            }//end while
            
        }//end dispatch_asynch
        
        
        //Start the UI update timer on the main queue
        dispatch_async(dispatch_get_main_queue() ) {
            [weak self] in
            
            //Start the update timer; calls updateUI() once every updateInterval
            self?.uiUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(self!.updateInterval, target:self!, selector: "updateUI", userInfo:nil, repeats: true)
            
            //since the closure only has one expression in it we need to explicityly return. otherwise we will have problems with Swifts ""Implicit Returns from Single-Expression Closures" See: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-XID_158
            return
        }
    }//end startup
    
    func shutdown()
    {
        //Stop and release the UI update timer on the main queue
        dispatch_async(dispatch_get_main_queue()) {
            [weak self] in
            self?.uiUpdateTimer?.invalidate()
            self?.uiUpdateTimer = nil
        }
    }//end shutdown
    
    func updateData()
    {
        
        //Dispatch a data update synchronously to the dataAccessQueue. Since dataAcessQueue is serial, it'll only run one code block at a time, in the order they are recieved.  if we do all read and writes to our data in the dataAccessQueue, there should not be any data contention issues
        
        dispatch_sync(self.dataAccessQueue) {
            [weak self] in
            
            //Our "data update" is just incrementing a counter
            self?.data += 1
            
            return
        }
        
    }//end updateData
    
    
    
    //let dataAccessQueue = dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //References : 
    // http://codereview.stackexchange.com/questions/61127/updating-the-ui-with-a-timer-code-intended-to-help-teach

}

