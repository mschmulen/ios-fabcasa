//
//  Logger.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

class Logger {
    
    // ----------------------------------------------------------
    // Singleton
    // ----------------------------------------------------------
    
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : Logger?
    }
    
    class var instance: Logger {
        dispatch_once(&Static.token) {  Static.instance = Logger() }
        return Static.instance!
    }
    
    init(){
        assert(Static.instance == nil, "Singleton instance already initialized!")
    }
    
    // ----------------------------------------------------------
    // ----------------------------------------------------------
    
    func print( message:String )
    {
        println(message)
    }
}


