//
//  JSCodeBlock.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation
import JavaScriptCore

class JSCodeBlock : NSObject{
    
    var name: String
    var code: String
    var language: String
    var author: String = "unknown"
    
    init(name: String, code: String, language: String ) {
        self.name = name
        self.code = code
        self.language = language
    }
    
    init(fileName: String)
    {
        self.name = "name"
        self.code = "code"
        self.language = "js"
        
        name = fileName
        language = "js"
        
        let path = NSBundle.mainBundle().pathForResource("/javascript/"+fileName, ofType:"js")
        //println( path  )
        var possibleContent = String.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error: nil)
        
        self.code = possibleContent!
        
    }
    
    func loadFromLocalSourceFile(fileName: String)
    {
        //NSString *path = [[NSBundle mainBundle] pathForResource:self.currentJavaScriptCode.javaScriptSourceFile ofType:@"js"];
        //NSString *jsCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        name = fileName
        language = "js"
        
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType:"js")
        
        println( path  )
        
        var possibleContent = String.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error: nil)
        
        self.code = possibleContent!
        
        /*
        if let content = possibleContent {
        var array = content.componentsSeparatedByString("\n")
        }
        */
        
        /*
        let path = NSBundle.mainBundle().pathForResource("fileName", ofType: "txt")
        var possibleContent = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
        
        if let content = possibleContent {
        var array = content.componentsSeparatedByString("\n")
        }
        */
        
    }
    
    func loadFromNetwork(url: String)
    {
        
    }
    
    
}
