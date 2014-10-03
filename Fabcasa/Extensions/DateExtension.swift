//
//  DateExtension.swift
//  fabcasa
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation


extension NSDate
    {
    
    // Create a date in the current locale using the date string in the format you specified
    // usage : NSDate(dateString:"2013-05-01")
    
    convenience init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
    
}
