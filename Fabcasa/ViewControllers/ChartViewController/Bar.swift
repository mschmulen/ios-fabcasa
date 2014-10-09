//
//  Bar.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//
// Reference credit to https://github.com/kevinzhow/PNChart-Swift
//

import UIKit
import QuartzCore

class Bar:UIView {
    var grade: CGFloat = 0.0 {
        didSet {
            UIGraphicsBeginImageContext(frame.size)
            
            var progressline:UIBezierPath = UIBezierPath()
            progressline.moveToPoint(CGPointMake(frame.size.width / 2.0, frame.size.height))
            progressline.addLineToPoint(CGPointMake(frame.size.width / 2.0, (1 - self.grade) * frame.size.height))
            progressline.lineWidth = 1.0
            progressline.lineCapStyle = kCGLineCapSquare
            chartLine.path = progressline.CGPath
            chartLine.strokeColor = barColor.CGColor
            var pathAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            pathAnimation.duration = 1.0
            pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            pathAnimation.fromValue = 0.0
            pathAnimation.toValue = 1.0
            chartLine.addAnimation(pathAnimation, forKey:"strokeEndAnimation")
            chartLine.strokeEnd = 1.0
            
            UIGraphicsEndImageContext()
        }
    }
    var chartLine: CAShapeLayer!
    var barColor: UIColor = ChartStyle.Instance.BarChartBarColor
    var barRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = barRadius
        }
    }
    
    func rollBack() {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({() -> Void in
            self.chartLine.strokeColor = UIColor.clearColor().CGColor
        }), completion: ({(Bool) -> Void in
            
        }) )
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        chartLine              = CAShapeLayer()
        chartLine.lineCap      = kCALineCapButt
        chartLine.fillColor    = UIColor.whiteColor().CGColor
        chartLine.lineWidth    = frame.size.width
        chartLine.strokeEnd    = 0.0
        clipsToBounds      = true
        backgroundColor = ChartStyle.Instance.BackgroundColor
        layer.addSublayer(chartLine)
        barRadius = 2.0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect)
    {
        //Draw BG
        var context: CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, self.backgroundColor?.CGColor)
        CGContextFillRect(context, rect)
    }
    
}

