//
//  FirstViewController.swift
//  mvvm-swift
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func actionCreateQuote(sender: AnyObject) {
        
        let quote = Quote(content: textFieldQuoteContent.text, scene: textFieldQuoteScene.text)
        
    }
    
    @IBOutlet weak var textFieldQuoteScene: UITextField!
    @IBOutlet weak var textFieldQuoteContent: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

