//
//  AlertController.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/3/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//
import UIKit


/*

usage:

    self.presentViewController(AlertController.factory(), animated: true) {
        // ...
    }

references: http://nshipster.com/uialertcontroller/ 

*/

class AlertController
{
    
    func factory() -> UIAlertController
    {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            println(action)
        }
        alertController.addAction(cancelAction)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { (action) in
            println(action)
        }
        alertController.addAction(destroyAction)
        
        return alertController;
    }
    
    func factoryMultipleButton() -> UIAlertController {
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        let oneAction = UIAlertAction(title: "One", style: .Default) { (_) in }
        let twoAction = UIAlertAction(title: "Two", style: .Default) { (_) in }
        let threeAction = UIAlertAction(title: "Three", style: .Default) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    func factoryLoginForm() -> UIAlertController {
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)

        
        let loginAction = UIAlertAction(title: "Login", style: .Default) { (_) in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            
            //callback for login
            //login(loginTextField.text, passwordTextField.text)
        }
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Login"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(forgotPasswordAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    func factorySignUpForm() -> UIAlertController
    {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Email"
            textField.keyboardType = .EmailAddress
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password Confirmation"
            textField.secureTextEntry = true
        }
        
        return alertController
    }
    
    
}