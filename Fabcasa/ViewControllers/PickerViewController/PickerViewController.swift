//
//  PickerViewController.swift
//  fabcasa
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    let pickerData = [
        ["37\"","44\"","28\"","33\""],
        ["Valiant","Tanyana","Hawkfarm","Beneteau","HansChristian"]
    ]
    
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var labelSelectedItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK -Delgates and DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let size = pickerData[0][pickerView.selectedRowInComponent(0)]
        let make = pickerData[1][pickerView.selectedRowInComponent(1)]
        labelSelectedItem.text = "Boat: " + size + " " + make
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
