// Playground - noun: a place where people can play

import UIKit


//UILabel
let testLabel = UILabel(frame: CGRectMake(0, 0, 120, 40))
testLabel.text = "Hello, Swift!"
testLabel.backgroundColor = UIColor(red: 0.9, green: 0.2, blue: 02, alpha: 1.0)
testLabel.textAlignment = NSTextAlignment.Center
testLabel.layer.masksToBounds = true
testLabel.layer.cornerRadius = 10

// 2 - Allows the label to be added to the Assistant Editor
testLabel

testLabel.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.9, alpha: 1.0)
testLabel.textColor = UIColor.whiteColor()
testLabel.layer.masksToBounds = true
testLabel.layer.cornerRadius = 10

//XCPShowView("myLabel", testLabel)


//UIView

let testView =  UIView(frame: CGRectMake(0,0, 120, 40 ) )
testView.backgroundColor = UIColor.lightGrayColor()

testView




