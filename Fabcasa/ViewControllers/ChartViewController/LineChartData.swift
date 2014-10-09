//
//  LineChartData.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//
// Reference credit to https://github.com/kevinzhow/PNChart-Swift
//

import UIKit

class LineChartDataItem{ var y:CGFloat = 0.0 }

class LineChartData{
    
    enum LineChartPointStyle:Int{
        case LineChartPointStyleNone = 0
        case LineChartPointStyleCycle
        case LineChartPointStyleTriangle
        case LineChartPointStyleSquare
    }
    
    var getData = ({(index: Int) -> LineChartDataItem in
        return LineChartDataItem()
    })
    
    var inflexionPointStyle:LineChartPointStyle = LineChartPointStyle.LineChartPointStyleNone
    var color:UIColor = UIColor.grayColor()
    var itemCount:Int = 0
    var lineWidth:CGFloat = 2.0
    var inflexionPointWidth:CGFloat = 6.0
}