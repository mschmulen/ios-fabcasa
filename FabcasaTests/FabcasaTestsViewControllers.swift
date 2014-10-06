//
//  FabcasaTestsViewControllers.swift
//  Fabcasa
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import XCTest

class FabcasaTestsViewControllers: XCTestCase {
    
    //ViewControllers
    //var vc:ViewController = ViewController()
    
    var animationViewController: AnimationViewController!
    var pickerViewController: PickerViewController!
    
    /*
    var storybard:UIStorybard?
    var anyVC:AnyObject?
    var viewController:UIViewController?
    var uiViewController:UIViewController?
    
    storyBoard = UIStoryboard(name:"Main", bundle:nil)
    storyBoard = UIStoryboard(name:"Main", bundle:NSBundle(forClass: self.dynamicType))
    XCTAssert(storyboard != nil)
    
    
    
    ---
    
    var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
    vc = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as LoginViewController
    vc.loadView()
    
    
    */
    
    /*
    //Storyboards
    - (void)setUp
    {
        [super setUp];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.vc = [storyboard instantiateViewControllerWithIdentifier:@"main"];
        [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
        vc = UIApplication.sharedApplication().windows[0].rootViewController as? UIViewController
        if ( let vc = viewController?)
        {
        vc.loadView()
        }
    }
    
    */
    
    override func setUp() {
        super.setUp()
        
        /*
        //let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        self.animationViewController  = AnimationViewController(nibName: "AnimationViewController", bundle:nil )
        self.animationViewController.loadView()
        self.animationViewController.viewDidLoad()
        
        if let animationViewController = AnimationViewController as? AnimationViewController {
            println("PickerViewController is lookign good ")
        }*/
        
        //pickerViewController = PickerViewController(nibName:"PickerViewController", bundle:nil)
    }
    
    func testPickerViewControllerDidLoad()
    {
        //var delegate = UIApplication.sharedApplication().delegate as AppDelegate
        //delegate.resApp()
        //delegate.
        /*
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.redColor()
        //window!.rootViewController = vc
        */
        
        // we only have access to this if we import our project above
        //let vc = PickerViewController(nibName: "PickerViewController", bundle:nil)
        let vc  = LoginViewController(nibName: "LoginViewController", bundle:nil )
        
        //XCTAssert(vc != nil, "Test Not Configured Properly")
        
        //let vc = PickerViewController(nibName:"PickerViewController", bundle: NSBundle(forClass:self.dynamicType) )
        //vc.
        //vc.loadView()
        //vc.viewDidLoad()
        XCTAssertNotNil(vc.view, "View Did Not load")
        
        
        
        
        
        

        
        
        
        
        //[testController stub:@selector(fetchData)];
        //[[[testController should] receive] fetchData];
        //[testController viewDidLoad];
        
        //assertThat(viewController.view, isNot(nilValue()));
        //assertThat(viewController.button, isNot(nilValue()));
        //    assertThat([viewController.button actionsForTarget:viewController forControlEvent:UIControlEventTouchUpInside], onlyContains(@"testAction", nil));
    }
    
    /*
    // we can't do much  without a view on our root View Controller
    func testAnimationViewControllerDidLoad()
    {
        // we only have access to this if we import our project above
        let vc = AnimationViewController(nibName: "AnimationViewController", bundle:nil)
        vc.loadView()
        XCTAssertNotNil(vc.view, "View Did Not load")
    }
    */
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        animationViewController = nil
        pickerViewController = nil
    }
    
    /*
    func testExample() {
        
        //test precondition
        XCTAssertNotNil( animationViewController, "AnimationViewController cannot be null")
        //XCTAssertNotNil( pickerViewController, "PickerViewController cannot be null")
        

        //if let vc = PickerViewController as? PickerViewController {
        //    println("PickerViewController is lookign good ")
       // }

        
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    */
    
}

