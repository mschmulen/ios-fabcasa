//
//  Logger.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

class PatternSingleton {
    
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : PatternSingleton?
    }
    
    class var instance: PatternSingleton {
        dispatch_once(&Static.token) {  Static.instance = PatternSingleton() }
        return Static.instance!
    }
    
    init(){
        assert(Static.instance == nil, "MySingleton already initialized!")
    }
    
}