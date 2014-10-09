//
//  ChartViewController.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//
// Reference credit to https://github.com/kevinzhow/PNChart-Swift
//

import UIKit

class ChartViewController: UIViewController , ChartDelegate {
    
    var CurrentChartLabelArray:[String] = ["SEP 1","SEP 2","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7"]
    var CurrentChartDataArray:[CGFloat] = [60.1, 160.1, 126.4, 262.2, 186.2, 127.2, 176.2]
                                        // [1,24,12,18,30,10,21]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeData()
        
        addLineChart(30)
        addBarChart(270)
    }
    
    func initializeData()
    {
        self.CurrentChartLabelArray.removeAll(keepCapacity: true)
        self.CurrentChartDataArray.removeAll(keepCapacity: true)
        
        let upper = 22
        let lower = 2
        
        for index in 1...20 {
            
            //let randNum = arc4random() * upper
            let randNum = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
            self.CurrentChartDataArray.append( CGFloat(randNum) )
            self.CurrentChartLabelArray.append( "L \(index)" )
        }
    }
    
    func addLineChart( yPos:CGFloat) {
        
        var ChartLabel:UILabel = UILabel(frame: CGRectMake(0, yPos, 320.0, 30))
        ChartLabel.textColor = ChartStyle.Instance.LabelColor
        ChartLabel.font = UIFont(name: "Helvetica Neue", size:23.0)
        ChartLabel.textAlignment = NSTextAlignment.Center
        ChartLabel.text = "Line Chart"
        
        var lineChart:LineChart = LineChart(frame: CGRectMake(0, yPos + 30, 320, 200.0))
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
        self.view.addSubview(lineChart)
        self.view.addSubview(ChartLabel)
        self.title = "Line Chart"
    }
    
    func addBarChart(yPos:CGFloat) {
        
        var ChartLabel:UILabel = UILabel(frame: CGRectMake(0, yPos, 320.0, 30))
        ChartLabel.textColor = ChartStyle.Instance.LabelColor
        ChartLabel.font = UIFont(name: "Helvetica Neue", size:23.0)
        ChartLabel.textAlignment = NSTextAlignment.Center
        ChartLabel.text = "Bar Chart"
        
        var barChart = BarChart(frame: CGRectMake(0, yPos + 30, 320.0, 200.0))
        barChart.backgroundColor = UIColor.clearColor()
        //            barChart.yLabelFormatter = ({(yValue: CGFloat) -> NSString in
        //                var yValueParsed:CGFloat = yValue
        //                var labelText:NSString = NSString(format:"%1.f",yValueParsed)
        //                return labelText;
        //            })
        barChart.labelMarginTop = 5.0
        barChart.xLabels = CurrentChartLabelArray
        barChart.yValues = CurrentChartDataArray
        barChart.strokeChart()
        
        barChart.delegate = self
        
        self.view.addSubview(ChartLabel)
        self.view.addSubview(barChart)
        
        self.title = "Bar Chart"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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

    

}
