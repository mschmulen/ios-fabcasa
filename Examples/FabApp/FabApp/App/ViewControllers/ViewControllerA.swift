//
//  ViewController.swift
//  FabApp
//
//  Created by Matt Schmulen on 10/6/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        Logger.instance.print("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

