//
//  LineChartLabel.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class ChartLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.boldSystemFontOfSize(10.0)
        textColor = ChartStyle.Instance.LabelColor
        backgroundColor = UIColor.clearColor()
        textAlignment = NSTextAlignment.Center
        userInteractionEnabled = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}