//
//  ArrayExtension.swift
//  FabApp
//
//  Created by Matthew Schmulen on 10/13/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import Foundation


extension Array {
    
    
    /*
    takeWhile function on Array.
    takeWhile runs the block on each element of Array until it returns false, then it stops and returns an Array of the prior elements.
    
    Usage:
    
        Input: [1,2,3,4,2,1].takeWhile { $0 < 3 }
        Output: R8: Array<Int> = 2 values { [0] = 1[1] = 2 }
    
    References:
        - https://gist.github.com/Eiam8821/07a7372667879172e9df
    
    */
    func takeWhile(f: Element -> Bool ) -> [Element]
    {
        var returnArray: [Element] = []
        for element in self {
            if f(element) {
                returnArray += [element]
            }
            else {
                break
            }
        }
        return returnArray
    }
    
}
