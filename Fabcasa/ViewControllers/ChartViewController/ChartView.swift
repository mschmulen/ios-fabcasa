//
//  ChartView.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//
// Reference credit to https://github.com/kevinzhow/PNChart-Swift
//

import UIKit

@IBDesignable class ChartView: UIView  {
    
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func prepareForInterfaceBuilder() {
        //if countElements(self.title) == 0 {
        //    self.title = "Line Chart"
        //}
    }
    
    @IBInspectable var integer: Int = 0
    @IBInspectable var float: CGFloat = 0
    @IBInspectable var double: Double = 0
    @IBInspectable var point: CGPoint = CGPointZero
    @IBInspectable var size: CGSize = CGSizeZero
    @IBInspectable var customFrame: CGRect = CGRectZero
    @IBInspectable var color: UIColor = UIColor.clearColor()
    @IBInspectable var string: String = "We ❤ Swift"
    @IBInspectable var bool: Bool = false
    
    //@IBInspectable var borderColor: UIColor = UIColor.clearColor()
    //@IBInspectable var borderWidth: CGFloat = 0
    //@IBInspectable var cornerRadius: CGFloat = 0
    
    /*
    let trackLayer = CALayer()
    let lowerThumbLayer = CALayer()
    let upperThumbLayer = CALayer()
    
    var CurrentChartLabelArray:[String] = ["SEP 1","SEP 2","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7"]
    var CurrentChartDataArray:[CGFloat] = [60.1, 160.1, 126.4, 262.2, 186.2, 127.2, 176.2]
    */
    
    /*
    // Chart Title
    @IBOutlet weak var titleLabel: UILabel!
    @IBInspectable var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    */
    
    /*
    public func liveDebugLog(message: String) {
        #if !(TARGET_OS_IPHONE)
            let logPath = "/tmp/XcodeLiveRendering.log"
            if !NSFileManager.defaultManager().fileExistsAtPath(logPath) {
                NSFileManager.defaultManager().createFileAtPath(logPath, contents: NSData(), attributes: nil)
            }
            
            var fileHandle = NSFileHandle(forWritingAtPath: logPath)
            fileHandle.seekToEndOfFile()
            
            let date = NSDate()
            let bundle = NSBundle(forClass: self.dynamicType)
            let application: AnyObject = bundle.objectForInfoDictionaryKey("CFBundleName")
            let data = "\(date) \(application) \(message)\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            fileHandle.writeData(data)
        #endif
    }
    */
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        titleLabel = UILabel(frame: CGRectMake(0, 0, 320.0, 30))
        titleLabel.textColor = ChartStyle.Instance.LabelColor
        titleLabel.font = UIFont(name: "Helvetica Neue", size:23.0)
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = "Line Chart"

        
        
        var lineChart:LineChart = LineChart(frame: frame )
        //var lineChart:LineChart = LineChart(frame: CGRectMake(0, 30, 320, 200.0))
        lineChart.yLabelFormat = "%1.1f"
        lineChart.showLabel = true
        lineChart.backgroundColor = UIColor.clearColor()
        lineChart.xLabels = CurrentChartLabelArray
        lineChart.showCoordinateAxis = true
        lineChart.delegate = self
        
        var data01:LineChartData = LineChartData()
        //data01.color = PNGreenColor
        data01.itemCount = self.CurrentChartDataArray.count
        data01.inflexionPointStyle = LineChartData.LineChartPointStyle.LineChartPointStyleCycle
        data01.getData = ({(index: Int) -> LineChartDataItem in
            var yValue:CGFloat = self.CurrentChartDataArray[index]
            var item = LineChartDataItem()
            item.y = yValue
            return item
        })
        
        lineChart.chartData = [data01]
        lineChart.strokeChart()
        
        lineChart.delegate = self
        
        //trackLayer.backgroundColor = UIColor.blueColor().CGColor
        self.addSubview(lineChart)

        //lowerThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        //self.addSubview(titleLabel)
        
        
    
        //trackLayer.backgroundColor = UIColor.blueColor().CGColor
        //layer.addSublayer(trackLayer)
        
        //lowerThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        //layer.addSublayer(lowerThumbLayer)
        
        //upperThumbLayer.backgroundColor = UIColor.greenColor().CGColor

    }
    */
    
    /*
    // func instantiateWithOwner(ownerOrNil: AnyObject!, options optionsOrNil: NSDictionary!) -> AnyObject[]!
    var nib = UINib(nibName: "KeyboardView", bundle: nil)
    let nibObjects = nib.instantiateWithOwner(self, options: nil)
    let nibView = nibObjects[0] as UIView
    */

    /*
    // MARK: - ChartDelegate
    func userClickedOnLineKeyPoint(point: CGPoint, lineIndex: Int, keyPointIndex: Int)
    {
        println("Click Key on line \(point.x), \(point.y) line index is \(lineIndex) and point index is \(keyPointIndex)")
    }
    
    func userClickedOnLinePoint(point: CGPoint, lineIndex: Int)
    {
        println("Click Key on line \(point.x), \(point.y) line index is \(lineIndex)")
    }
    
    func userClickedOnBarCharIndex(barIndex: Int)
    {
        println("Click  on bar \(barIndex)")
    }
    */

}
