//
//  ChartStyle.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class ChartStyle {
    
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : ChartStyle?
    }
    
    class var Instance: ChartStyle {
        dispatch_once(&Static.token) {  Static.instance = ChartStyle() }
        return Static.instance!
    }
    
    init(){
        assert(Static.instance == nil, "ChartStyle already initialized!")
    }
    
    //Line Chart
    var LineChartLineColor:UIColor = UIColor(red: 77.0 / 255.0 , green: 196.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    var LineChartAxisColor:UIColor = UIColor(red: 186.0 / 255.0 , green: 186.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
    //var LineChartLabelColor:UIColor = UIColor(red: 246.0 / 255.0 , green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    
    //Bar Chart
    var BarStrokeColor:UIColor = UIColor(red: 77.0 / 255.0 , green: 196.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    var BarChartBottomLineColor:UIColor = UIColor(red: 246.0 / 255.0 , green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    var BarChartLeftLineColor:UIColor = UIColor(red: 246.0 / 255.0 , green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    var BarChartLabelColor:UIColor = UIColor(red: 246.0 / 255.0 , green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    var BarChartBarColor:UIColor = UIColor(red: 77.0 / 255.0 , green: 196.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    
    //General
    var BackgroundColor:UIColor = UIColor(red: 246.0 / 255.0 , green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0) //LightGreyColor
    var LabelColor:UIColor = UIColor(red: 186.0 / 255.0 , green: 186.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0) //Grey Color
    
}
