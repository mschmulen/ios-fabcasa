// Playground - noun: a place where people can play

import UIKit

struct Style {
    
    let ColorBackround = UIColor.lightGrayColor()
    let ColorPink = UIColor(red: 0.9, green: 0.2, blue: 02, alpha: 1.0)
    let ColorBlue = UIColor(red: 0.1, green: 0.1, blue: 0.9, alpha: 1.0)
    let ColorTextColor = UIColor.whiteColor()
    
    let FontName = "Helvetica Neue"
    let FontSize = 30
    let LabelFont = UIFont (name: "Helvetica Neue", size: 30)

}

var S:Style = Style()

func factoryView( frame:CGRect ) -> UIView {
    let myView = UIView( frame )
    myView.backgroundColor = S.ColorBackround
    return myView
}

func factoryLabel( frame:CGRect ) -> UIView {
    let myLabel = UILabel(frame: frame)
    myLabel.text = "Left Label"
    //label.font = UIFont(name: S.FontName, size: S.FontSize)
    label.font = S.LabelFont
    myLabel.backgroundColor = S.ColorPink
    myLabel.textColor = S.ColorTextColor
    //myFirstLabel.numberOfLines = 5
    myLabel.textAlignment = NSTextAlignment.Center
    myLabel.layer.masksToBounds = true
    myLabel.layer.cornerRadius = 10
    return myLabel
}

func factoryButton( frame:CGRect ) -> UIButton
{
    let myButton = UIButton( frame: frame)
    myButton.setTitle("Button", forState: UIControlState.Normal)
    myButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    //myFirstButton.addTarget(self, action: "pressed", forControlEvents: .TouchUpInside)
    return myButton
}

func pressed(sender: UIButton!) {
    var alertView = UIAlertView();
    alertView.addButtonWithTitle("Ok");
    alertView.title = "title";
    alertView.message = "message";
    alertView.show();
}

println("hello")

// UIView
var view = factoryView(frame: CGRectMake(0,0, 400,200))

let myLabel = factoryLabel(frame: CGRectMake(10, 10, 120, 40))
view.addSubview( myLabel )

view.addSubview( factoryButton( frame:CGRectMAke(0,0,0100,130 )))

//var b = UIButton(frame: CGRectMake(0,0,100,130))
//b.setTitle("Button", forState: UIControlState.Normal)
//b.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//view.addSubview(b)

//var image = UIImageView( frame: CGRectMake(200,200,200,200))

//XCPShowView("myLabel", myLabel)

//UIView
view









