//
//  Projecteuler1.swift
//  fourTabTemplate
//
//  Created by Matthew Schmulen on 9/25/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation


class Problem1
{
    

// Project Euler #1 Solution in Swift
    
    func solution() -> String {
        return "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000."
    }
    
    func solution() {
        /*
        let sum = [Int](1..<1000).filter() { self.anyMultipleOf($0, [3, 5]) }.reduce(0) { $0 + $1 }
        println(sum)
        */
    }
    
    func anyMultipleOf(value: Int, numbers: [Int]) -> Bool {
        return numbers.reduce(false) {
            any, number in
            return any || ((value % number) == 0)
        }
    }


}

