// Playground - noun: a place where people can play

import UIKit
import QuartzCore

//UIView
let testView =  UIView(frame: CGRectMake(0,0, 120, 40 ) )
testView.backgroundColor = UIColor.lightGrayColor()

testView



class CustomDrawView: UIView {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        //Get the context
        let context = UIGraphicsGetCurrentContext()
        
        // Draw a path
        let pathA = CGPathCreateMutable()
        CGPathMoveToPoint(pathA, nil, 0, 0)
        CGPathAddLineToPoint(pathA, nil, 0, rect.size.height)
        CGPathAddLineToPoint(pathA, nil, 0, rect.size.width)
        
        //Apply the Path
        CGContextAddPath(context, pathA)
        
        //set context draw state
        CGContextSetLineWidth(context, 5)
        CGContextSetStrokeColorWithColor(context, UIColor.greenColor().CGColor)
        
        //Apply the contet
        CGContextStrokePath(context)
        
        let myDot = makeDot()
        myDot.frame = CGRectMake( 10, 10, 10, 10 )
        layer.addSublayer(myDot)
        
        //drawSimpleLabel()
        
    }
    
    // Returns a point for plotting
    func makeDot() -> CALayer {
        
        let dot = CALayer()
        dot.backgroundColor = UIColor.redColor().CGColor
        dot.cornerRadius = 5
        dot.masksToBounds = true
        
        return dot
    }
    
    func drawSimpleLabel()
    {
        let label = UILabel(frame: CGRectZero)
        label.text = "myLabel"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.greenColor()
        label.backgroundColor = UIColor.grayColor()
        label.textAlignment = NSTextAlignment.Right
        label.frame = CGRectMake(0, 0, 200, 200)
        addSubview(label)
    }

}

let drawView =  CustomDrawView(frame: CGRectMake(0,0, 120, 40 ) )
testView.backgroundColor = UIColor.lightGrayColor()

drawView








