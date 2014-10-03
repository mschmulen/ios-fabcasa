//
//  AppDelegate.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/1/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.redColor()
        //window!.rootViewController = ViewController()
        //window!.rootViewController = ViewController(nibName: "ViewController", bundle: nil)
        //window!.rootViewController = PickerViewController(nibName: "PickerViewController", bundle:nil )
        //window!.rootViewController = MFMailViewController(nibName: "MFMailViewController", bundle:nil )
        //window!.rootViewController = MPCViewController(nibName: "MPCViewController", bundle:nil )
        //window!.rootViewController = MessagingViewController(nibName: "MessagingViewController", bundle:nil )
        //window!.rootViewController = MapKitViewController(nibName: "MapKitViewController", bundle:nil )
        //window!.rootViewController = TimerViewController(nibName: "TimerViewController", bundle:nil )
        //window!.rootViewController = AnimationViewController(nibName: "AnimationViewController", bundle:nil )
        //window!.rootViewController = WebViewController(nibName: "WebViewController", bundle:nil )
        window!.rootViewController = LoginViewController(nibName: "LoginViewController", bundle:nil )
        //window!.rootViewController = SettingsViewController(nibName: "SettingsViewController", bundle:nil )
        //window!.rootViewController = UserProfileViewController(nibName: "UserProfileViewController", bundle:nil )
        
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

