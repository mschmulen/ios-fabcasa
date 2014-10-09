//
//  ChartDelegate.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

protocol ChartDelegate {
    func userClickedOnLinePoint(point: CGPoint, lineIndex:Int)
    func userClickedOnLineKeyPoint(point: CGPoint, lineIndex:Int, keyPointIndex:Int)
    func userClickedOnBarCharIndex(barIndex:Int)
}