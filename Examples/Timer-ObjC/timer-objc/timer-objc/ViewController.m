//
//  ViewController.m
//  timer-objc
//
//  Created by Matthew Schmulen on 11/9/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


void RUN_ON_UI_THREAD(dispatch_block_t block)
{
    if ([NSThread isMainThread])
        block();
    else
        dispatch_sync(dispatch_get_main_queue(), block);
}

- (void)updateBackgroundColor:(UIColor *) color
{
    
    NSLog(@"updateBackgroundColor");
    
    /*
    // First approach
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.view.backgroundColor = color;
    });
    */
    
    // Second approach
    /*
    if ([NSThread isMainThread])
    {
        self.view.backgroundColor = color;
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.view.backgroundColor = color;
        });
    }
    */
    
    //Second approach with block
    dispatch_block_t work_to_do = ^{
        self.view.backgroundColor = color;
    };
    
    if ([NSThread isMainThread])
    {
        work_to_do();
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), work_to_do);
    }
    
    //Second approach with External Function
    /*
     
     - (void)updateBackgroundColor:(UIColor *)color
     {
        RUN_ON_UI_THREAD(^{
            self.view.backgroundColor = color;
        });
     }
     */
    
    /*
     Notes:
     
    The “sync” part of the function name (as differentiated from “async”) means that the code that comes after the dispatch_sync call (and in this case, the code which sent the -updateBackgroundColor: message) will not continue to run until the work inside the block is done. This can be useful where the code that follows makes the assumption that the work inside the block has been done (e.g. if it were then to query the backgroundColor property of the view later on). Making the “async” version of the call throws the work to be done on a queue, and processes it later on, when the specified queue gets its chance to run again. It looks similar to the synchronous version:
     
     dispatch_async(dispatch_queue_t queue, ^(void)block)
     
     Many of the dispatch_* functions operate on dispatch queues. Here, we are operating on the main queue, which is connected with the main run loop (our UI thread):
     
     dispatch_get_main_queue()
     
     What about if we want to be able to call the same method, but from the UI thread? This creates a problem! The dispatch_sync function places its block of work to be done at the end of the main dispatch queue. It will then block until that work has been done. However, we’re already in the main thread, and until we return to the run loop, the block won’t be scheduled to run. This creates a deadlock – something we want to avoid. We can fix this with the following modification:
     
     - (void)updateBackgroundColor:(UIColor *)color
     {
        if ([NSThread isMainThread])
        {
        self.view.backgroundColor = color;
        }
        else
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
            self.view.backgroundColor = color;
            });
        }
     }
    */
    
    // References:
        // http://chritto.wordpress.com/2012/12/20/updating-the-ui-from-another-thread/
    
    // TODO :
    
    // http://www.ios-developer.net/iphone-ipad-programmer/development/threads/updating-ui-controls-on-background-threads
    
    // http://stackoverflow.com/questions/11242307/how-to-update-a-ui-label-from-a-non-ui-thread-in-ios
    
    // http://stackoverflow.com/questions/20590802/objective-c-trouble-updating-ui-on-main-thread
    
    
}

@end
