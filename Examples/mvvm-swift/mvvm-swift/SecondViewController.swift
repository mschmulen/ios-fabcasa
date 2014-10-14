//
//  SecondViewController.swift
//  mvvm-swift
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit


/*

    MVVM Model-View-ViewModel

    Especially useful when writing iOS applications in Swift aka working with Optionals.

    Note that only when the user clicks Save, does the Quote object actually get created (if the fields are filled in of course!). Instead, the quoteViewModel object is manipulated as the user fills in the Quote fields.

    Notes: 

    - Business logic goes into the ViewModel classes
    - UI Logic goes into the view controller classes
    - A good coding guard rail I used was to never import the System.Windows.Forms namespace into my ViewModel classes.

    More reading:
    https://coderwall.com/p/virp-q


    Architecture:

    - ViewController
    - View
    - BLL ( Business Logic Layer )
    - Model
    - ViewModel

*/


class SecondViewController: UITableViewController {

    private let quoteViewModel = QuoteViewModel()
    
    private let textCellId = "myTextCell"
    private let numberOfFields = 2
    
    // +++++++++++++++++++++++++++++++++++++++++++++
    //
    // +++++++++++++++++++++++++++++++++++++++++++++
    private enum QuoteField: Int {
        case Content, Scene
    }
    
    
    // +++++++++++++++++++++++++++++++++++++++++++++
    // MARK: Actions
    // +++++++++++++++++++++++++++++++++++++++++++++

    @IBAction func onSaveTap(sender: UIBarButtonItem) {
        if let quote = quoteViewModel.createQuote() {
            // SAVE quote in your data store
            navigationController?.popViewControllerAnimated(true)
        } else {
            let alertController = UIAlertController(title: "All fields required", message: "Please make sure all fields are filled in to add the quote!", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++
    // MARK: TableViewController Delegate
    // +++++++++++++++++++++++++++++++++++++++++++++
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfFields
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellId) as UITableViewCell //as TextInputTableViewCell
        
        if let quoteField = QuoteField.fromRaw(indexPath.row) {
            
            switch quoteField {
            case .Content:
                println("content")
                cell.textLabel?.text = "yack"
                /*
                cell.configure(text: quoteViewModel.quoteContent,
                    placeholder: quoteViewModel.quoteContentPlaceholder,
                    textFieldChangedHandler: {[weak self] (newText) in
                        if let strongSelf = self {
                            strongSelf.quoteViewModel.quoteContent = newText
                        }
                })
                */
            case .Scene:
                println("scene")
                cell.textLabel?.text = "scene"
                /*
                cell.configure(text: quoteViewModel.quoteScene,
                    placeholder: quoteViewModel.quoteScenePlaceholder,
                    textFieldChangedHandler: {[weak self] (newText) in
                        if let strongSelf = self {
                            strongSelf.quoteViewModel.quoteScene = newText
                        }
                })
                */
            }
        }
        
        return cell
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++
    // MARK: ViewController 
    // +++++++++++++++++++++++++++++++++++++++++++++
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

