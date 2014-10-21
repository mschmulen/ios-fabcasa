//
//  ViewController.swift
//  crash-swift
//
//  Created by Matthew Schmulen on 10/21/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        crashA()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func crashA()
    {
        //var foo : AnyObject? = nil
        var foo: String = "nil"
        
        println("yack \(foo)" )
        
        
        //var bar : AnyObject = foo!
        var bar : AnyObject = foo
        
        println(" \(bar)" )
    }
    
    /*
    func findElement<T>(var array: Array<T>, car match: T -> Bool) -> T? {
        for index in 0 ...array.count {
            if
        }
        return nil
    }
    
    func FindElement<T>(var array : Array<T>, var match : T -> Bool) -> T? {
        for index in 0...array.count {
            if (match(array[index])) {
                return array[index]
            }
        }
    }*/
}

