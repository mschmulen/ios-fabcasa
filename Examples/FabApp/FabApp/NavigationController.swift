//
//  NavigationController.swift
//  FabApp
//
//  Created by Matt Schmulen on 10/7/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class NavigationController: SlideMenuNavigationController , SlideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = SlideMenu(sourceView: self.view, menuTableViewController: MenuTableViewController())
        sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
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
