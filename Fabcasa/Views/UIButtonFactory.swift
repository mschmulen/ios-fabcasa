//
//  UIButtonFactory.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/3/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class UIButtonFactory
{
    
    func factoryButtonBase( title:String) -> UIButton {
        let button = UIButton()
        
        button.titleLabel?.text = title
        
        return button
    }
    
    func factoryButtonClose() -> UIButton  {
        let button = factoryButtonBase("Close")
        
        
        return button
    }
    
}