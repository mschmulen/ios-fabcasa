//
//  MessagingViewController.swift
//  Fabcasa
//
//  Created by Matthew Schmulen on 10/1/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {

    
    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func actionButtonSend(sender: AnyObject) {
        
        //Send the message
        var messageData = CellData()
        messageData.message = self.textView.text
        
        //self.tableData.addObject( messageData )// addObject:message];
        self.tableData.append(messageData)
        
        //Clear the message from the field
        self.textView.text = "";
        self.textView.resignFirstResponder();
        
        self.tableView.reloadData();
    }
    
    @IBAction func actionButtonCancel(sender: AnyObject) {
        //Cancel post
        self.textView.text = "";
        self.textView.resignFirstResponder();
    }
    
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - UIVIewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        registerForKeyboardNotifications()
        /*
        addEffect( UIBlurEffect( style: UIBlurEffectStyle.Light), offset:0 )
        addEffect( UIBlurEffect( style: UIBlurEffectStyle.Dark), offset:50 )
        addEffect( UIBlurEffect( style: UIBlurEffectStyle.ExtraLight), offset:100 )
        */
    }
    
    func addEffect( effect:UIVisualEffect , offset:CGFloat){
        var effectView = UIVisualEffectView( effect: effect)
        effectView.frame = CGRectMake(0, offset, 320, 50 )
        view.addSubview( effectView )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //#pragma mark - UITableViewDataSource, UITableViewDelegate
    
    let cellIdentifier = "MessagingTableViewCell"
    
    struct CellData
    {
        var userID = "userID"
        var message = "message"
        var localID = 1
        var createdDate = NSDate()
    }
    
    var tableData = [CellData]()
    
    func initialize(){
        
        var nib = UINib(nibName: "MessagingTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: self.cellIdentifier)
        //self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        /*
        for index in 0...100 {
        self.tableData.append( CellData(name: "name\(index)", message: "message\(index)" ) )
        }
        */
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:MessagingTableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as MessagingTableViewCell
        
        cell.labelName?.text = self.tableData[indexPath.row].userID
        cell.labelMessage?.text = self.tableData[indexPath.row].message
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        println("You selected cell #\(indexPath.row)!")
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        println("prepare for segue");
    }
    
    //#pragma mark - UITextFieldDelegate
    
    func registerForKeyboardNotifications()
    {
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: self.view.window)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: self.view.window)
        
    }
    
    func keyboardWillShow(n:NSNotification )
    {
        // unwrap our userInfo dictionary
        //let userInfo:Dictionary<String,String!> = n.userInfo as Dictionary<String,String!>
        
        let userInfo = n.userInfo
        println( userInfo)
        let keyboardFrame = userInfo?[UIKeyboardFrameBeginUserInfoKey] //as NSRect
        println( keyboardFrame)
        let keyboardSize = keyboardFrame?.size
        println( keyboardSize )
        
        // get the size of the keyboard
        //CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        //let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey]
        //let keyboardSize:CGSize = keyboardFrame.size
        
        // animate the textField
        // animateTextField(self.messageView, distance:keyboardSize!.height, up: true);
        animateTextField(self.messageView, distance:400, up: true);
    }
    
    func keyboardWillBeHidden(n:NSNotification)
    {
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero;
        //animate the textField
        animateTextField(self.messageView, distance:0, up: false);
    }
    
    func keyboardWasShown(n:NSNotification)
    {
        //NSDictionary* info = [aNotification userInfo];
        //CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        //contentInsets:UIEdgeInsets = UIEdgeInsets(0.0, 0.0, kbSize.height, 0.0);
        
        //animate the textField
        animateTextField(self.messageView, distance:200, up: true);
    }
    
    func animateTextField(textFieldView:UIView, distance:CGFloat, up:Bool)
    {
        let movementDistance = 258; // tweak as needed
        let movementDuration = 0.3; // tweak as needed
        
        let movement:CGFloat = (up ? CGFloat(-movementDistance) : CGFloat(movementDistance) );
        
        UIView.beginAnimations("anim", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    

}
