//
//  WebViewController.swift
//  fourTabTemplate
//
//  Created by Matthew Schmulen on 9/7/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView?
    var urlString: String = "http://www.woot.com"
    
    @IBOutlet var containerView: UIView!
    
    @IBAction func actionClose(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("dismiss view controler complete")
        })
        
    }
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string:urlString)
        var req = NSURLRequest(URL:url)
        self.webView!.loadRequest(req)
        
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
    
    
    /*
    Notes
    
    User scripts
    
    In short, user scripts are pieces of JavaScript which are injected into the web-page the WKWebView is loading. A user script is either injected and run before the content (DOM) has loaded or after the DOM is finished loading. A user script can do anything a "regular" JavaScript script can do on the page, including manipulating the DOM and calling any existing JavaScript methods in the page which was loaded. A user script is how your native application talks to JavaScript.
    
    
    Script messages
    
    This is how any script on the web-page can communicate back to your native app. A script message exposes a method in JavaScript which any can be called by any script in the web-page. You will need to define a handler in you native app which handles incoming messages from the web-site. A script message can originate from a user script or any other script loaded into the web-page handled by the WKWebView.
    
    The demo application
    
    In this small demo application we'll look at how to change the color of a DOM element by calling a JavaScript method from our native application while at the same time listening for asynchronous messages sent from the JavaScript in the html page to the native application. Let's get started!
    
    To communicate between a web-page and WKWebView we need two main elements.
    
    A web-page with some JavaScript for which the WKWebView can load
    A WKWebView native application which talks to the web-page
    The web-page
    
    The web-page is really simple. There are two files, one «index.html» file which is the web-page and one «main.js» file which «index.html» includes at the end of its body tag.
    
    The content of the JavaScript «main.js» is as follows. (the complete code including the HTML can be found at the bottom of the article)
    function callNativeApp () {
    try {
    webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript");
    } catch(err) {
    console.log('The native context does not exist yet');
    }
    }
    
    setTimeout(function () {
    callNativeApp();
    }, 5000);
    
    function redHeader() {
    document.querySelector('h1').style.color = "red";
    }
    When this script loads it will wait 5 seconds and then call the «callNativeApp» method. The only thing to note here is the "callbackHandler". This is the name of the script message handler we will define later in the native application.
    
    Also, I'm wrapping the callback to "webkit.messageHandlers....." in a try catch block to avoid the script falling over when it's running outside of a native app context.
    
    There is also a tiny function which will change the header in the HTML page to a red color when run, well use this later.
    
    You can load this web-page from a server or simply include it in your app. I'll be loading it from a local server to simulate a more realistic example.
    
    The native application
    
    The first thing you need to do is to point the WKWebView we created in the previous article to the new test URL. You'll need to include you own path here. If you're wondering how to set this up please refer to the Getting started with WKWebView using Swift in iOS 8 article this article build upon.
    var url = NSURL(string:"http://localhost/WKJSDemo/")
    var req = NSURLRequest(URL:url)
    self.webView!.loadRequest(req)
    The WKWebView configuration
    In «Getting started with WKWebView using Swift in iOS 8» we initialized the WKWebView with no parameters, like so: self.webView = WKWebView()
    
    This is fine for simply loading a web-page. Now however we want to inject some script into the page and this calls for some additional configuration.
    
    The WKWebView constructor has a «configuration» parameter which takes a WKWebViewConfiguration instance. Several things can be set on this, like settings for the WebView for example turning JavaScript on or off and so on. What we need though is the userContentController property of the WKWebViewConfiguration.
    
    The userContentController property expects an instance of WKUserContentController which has a method called addUserScript. We utilize this method to add the user script. Phew! Let's look at a simple example.
    The first thing to do is to create a content controller.
    var contentController = WKUserContentController();
    Now we need a user script to pass into the addUserScript method of the content controller.
    var userScript = WKUserScript(
    source: "redHeader()",
    injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
    forMainFrameOnly: true
    )
    
    contentController.addUserScript(userScript)
    Our JavaScript (source) is in this case a call to the «redHeader» function we defined in the JavaScript file. The «injectionTime» parameter tells the user script that it should be run when the body of the HTML page has been loaded. The other way of doing this would be to specify «AtDocumentStart» which would run the script before the body element was loaded. The «forMainFrameOnly» parameter simply says that this script will only be injected for the main frame of the HTML page. The next line adds the userScript to the contentController.
    
    Great, now we need to create a configuration and then add the contentController to it and pass the configuration into the WebView constructor.
    var config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    self.webView = WKWebView(
    frame: self.containerView.bounds,
    configuration: config
    )
    Now try to run it, you should see a HTML page with a red header.
    
    Note that the WKWebView constructor requires a "frame" parameter. This tells the web view how big it should be and is very common pattern in UIKit classes.
    
    Having the JavaScript call the native app
    
    Now that we know how to call JavaScript methods from the native app we'll want to let the JavaScript methods call back to the native app. As we have discussed, this is done by utilizing «script messages».
    
    Adding the delegate method
    
    To be able to receive events from JavaScript your ViewController needs to conform the «WKScriptMessageHandler» protocol. This means two things. We need to inherit from «WKScriptMessageHandler» and implement the «userContentController» delegate method. Let's start with extending the suprtclass.
    class ViewController: UIViewController, WKScriptMessageHandler
    Here we update the ViewController to include the «WKScriptMessageHandler». This will give you an error, this is because we haven't yet implemented the «userContentController» delegate method. We'll do this now.
    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
    if(message.name == "callbackHandler") {
    println("JavaScript is sending a message \(message.body)")
    }
    }
    Notice that we check if the message name is «callbackHandler». Remember back to that line in the JavaScript which read «webkit.messageHandlers.callbackHandler.postMessage..». Here in the native method which receives the script message we need to verify that the message is what we expect it to be. If the message is what we expect we print the body of the message to the console.
    
    Next up, we need to tell the web view to start listening for events from JavaScript. This is done by adding a script handler to the contentController. So, just below the line where we call «addUserScript», we now add:
    contentController.addScriptMessageHandler(
    self,
    name: "callbackHandler"
    )
    The first parameter «self» means that the script message delegate is the ViewController. If you wanted to handle script messages in another class you could pass that class here. The name is the name which will be used in the JavaScript to call the native «userContentController» delegate method.
    
    Try to run it. The header should now be read and after five seconds you should get a message in the Xcode console. Success!
    
    
    
    */
    
    
}
