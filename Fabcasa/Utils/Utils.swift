//
//  Utils.swift
//  FabApp
//
//  Created by Matthew Schmulen on 10/13/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class Utils {
    
    
    /*
    Defaults
    
    Usage:
    
    
    */
    class func setDefaults(key: String, withValue value: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
        defaults.synchronize()
    }
    
    class func getDefaults(key: String) -> AnyObject? {
        var defaults = NSUserDefaults.standardUserDefaults()
        var value: AnyObject? = defaults.objectForKey(key)
        return value
    }
    
    
    
    /*
    */
    class func getStringFromInfoBundleForKey(key: String) -> String {
        var value = NSBundle.mainBundle().objectForInfoDictionaryKey(key) as? String
        return value ?? ""
    }

    
   
}
