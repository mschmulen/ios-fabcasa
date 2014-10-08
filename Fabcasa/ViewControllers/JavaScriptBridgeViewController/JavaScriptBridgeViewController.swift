//
//  JavaScriptBridgeViewController.swift
//  ExampleTemplate
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import JavaScriptCore

class JavaScriptBridgeViewController: UIViewController {
    
    var code: JSCodeBlock?
    
    @IBOutlet weak var codeBlock: UITextView!
    @IBOutlet weak var console: UITextView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    
    @IBAction func actionEval(sender: AnyObject) {
        self.evaluateCurrentCode()
    }
    
    @IBAction func actionClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func actionClearConsole(sender: AnyObject) {
        self.console.text = ""
    }
    
    func cLog( message:String )
    {
        println("From ConsoleLog \(message)")
    }
    
    
    
    func evaluateCurrentCode()
    {
        
        let context = JSContext()
        
        //context.set("foo", [1,2,3])
        
        //println(context.get("bar")) // [1, 4, 9]
        
        //let script = "var value = encodeURI('<name>');"
        let script = "var mystring = \"matt\"; var foo = [1,2,3]; var bar = foo.map(function(n){return n*n});"
        let jsvAA = context.evaluateScript(script)
        
        println("------------")
        println( jsvAA.toString() )
        
        let value:JSValue = context.objectForKeyedSubscript("bar")
        println( value.toString() )
        println("------------")
        
        println( context.objectForKeyedSubscript("mystring").toString() )
        context.setObject("jeff", forKeyedSubscript:"mystring")
        println( context.objectForKeyedSubscript("mystring").toString() )
        
        
        //Exception Handler
        
        context.exceptionHandler = {
            (context:JSContext!, exception:JSValue!)->Void in
            
            println("Error: \(exception.toString())")
            //also send to the console
            self.cLog("Error: \(exception.toString())")
            
        };
        
        //Exception handler test
        context.evaluateScript("throw Error(message);")
        
        
        
        println("Requires bridge from here on out . ----------")
        println("------------")
        
        let function = { (values:AnyObject!)->AnyObject in
            var sum:Int = 0
            for value in values as NSArray
            {
                sum += value.integerValue
            }
            return sum
        }
        
        //context.setUnaryFunction(function,forKeyedSubscript:"sum")
        //context.evaluateScript("sum([10,20,30]);")
        
        println("------------")
        
        println("------------")
        
        
        
        
        
        /*
        toInt32() ->Int32
        • toUint32() ->Uint32
        • toDouble() ->Double
        • toString() ->String!
        • toBool() ->Bool
        • toDate() ->NSDate!
        • toPoint() ->CGPoint
        • toSize() ->CGSize
        • toRect() ->CGRect
        • toRange() ->NSRang
        
        
        • toObject() ->AnyObject!
        • toArray() ->[AnyObject]!
        • toDictionary() ->[NSObject:AnyObject]!
        • toNumber() ->NSNumber!
        
        
        • isNumber()
        • isString()
        • isBoolean()
        • isObject()
        • isNull()
        • isUndefined()
        
        */
        
        
        
        /*
        //MISC
        println("------------")
        let ary = [0, 1, 2, 3]
        var jsv = context.evaluateScript(
        "\(ary).map(function(n){return n*n})"
        )
        println(jsv)
        println("------------")
        
        var a = jsv.toArray()
        println(a)
        jsv = context.evaluateScript("nonsense * nonsense")
        println(jsv)
        jsv = context.evaluateScript("this")
        println(jsv)
        */
        
        println("------------")
        
        /*
        typealias ID = AnyObject!
        extension JSContext {
        func fetch(key:NSString)->JSValue {
        return getJSVinJSC(self, key)
        }
        func store(key:NSString, _ val:ID) {
        setJSVinJSC(self, key, val)
        }
        func store(key:NSString, _ blk:()->ID) {
        setB0JSVinJSC(self, key, blk)
        }
        func store(key:NSString, _ blk:(ID)->ID) {
        setB1JSVinJSC(self, key, blk)
        }
        func store(key:NSString, _ blk:(ID,ID)->ID) {
        setB2JSVinJSC(self, key, blk)
        }
        }
        context.store("ary", [1,2,3])
        jsv = ctx.evaluateScript("bar=foo.map(function(n){return n*n})")
        println(ctx.fetch("bar"))
        
        // block w/ no argument
        context.store("hello") { ()->ID in
        return "Hello, JS! I am Swift."
        }
        println(context.evaluateScript("hello"))
        println(context.evaluateScript("hello()"))
        // block w/ 1 argument
        context.store("square") { (o:ID)->ID in
        if let x = o as? Double {
        return x * x
        }
        return nil
        }
        println(context.evaluateScript("square"))
        println(context.evaluateScript("square()"))
        println(context.evaluateScript("square(6)"))
        
        // block w/ 2 arguments
        context.store("multiply") { (o:ID, p:ID)->ID in
        if let x = o as? Double {
        if let y = p as? Double {
        return x * y
        }
        }
        return nil
        }
        println(context.evaluateScript("multiply"))
        println(context.evaluateScript("multiply()"))
        println(context.evaluateScript("multiply(6)"))
        println(context.evaluateScript("multiply(6,7)"))
        
        // for any more arguments, just use array instead
        context.store("sum") { (o:ID)->ID in
        if let a = o as? NSArray {
        var result = 0.0
        for v in a {
        if let n = v as? Double {
        result += n
        } else {
        return nil
        }
        }
        return result
        }
        return nil
        }
        println(context.evaluateScript("sum([0,1,2,3,4,5,6,7,8,9])"))
        */
        
        
        
        
        
        
        
        
        
        
        
        println("------------")
        
        
        
        /*
        
        @import JavaScriptCore;
        
        ...
        
        // get UIWebView's JavaScript context
        JSContext *ctx = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        
        // 'listen' to console.log()
        ctx[@"console"][@"log"] = ^(NSString *message) {
        NSLog(@"Javascript's console.log() :\n%@\n\n", message);
        };
        */
        
        /*
        //PreLoad JavaScript to Swift callbacks and objects
        context.set("foo", [1,2,3])
        jsv = context.evaluateScript("bar = foo.map(function(n){return n*n})")
        println(context.get("bar")) // [1, 4, 9]
        
        context.
        */
        
        //consoleLog
        //context.
        
        //context["consoleLog"] = ({ println("yack yack ")})
        /*
        self.context[@"consoleLog"] = ^(NSString *message) {
        [self logger: message];
        };
        
        
        //execute factorial in native Obj-C , Logger(@"5! = %@", factorial(5) );
        self.context[@"factorial"] = ^(int x) {
        int factorial = 1;
        for (; x > 1; x--) {
        factorial *= x;
        }
        return factorial;
        };
        
        //UI stuff
        self.context[@"setBackgroundColor"] = ^()  // Logger(@"sum2 = %@", sum2(4,5)
        {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *newColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [self.view setBackgroundColor: newColor ];
        };
        
        
        
        */
        
        
        /*
        // load javascript file in String
        let homeDir = NSHomeDirectory()
        let jsSource: String! = String.stringWithContentsOfFile(homeDir+"/javascript/jshooks.js")
        println(jsSource)
        */
        
        let path = NSBundle.mainBundle().pathForResource("/javascript/jshooks", ofType:"js")
        println( path  )
        var possibleContent = String.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error: nil)
        
        //println( possibleContent)
        context.evaluateScript(possibleContent)
        
        // get reference to console.Log() function
        let consoleLog = context.objectForKeyedSubscript("consoleLog")
        
        /*
        //Calling javascript methods from Swift
        
        // get reference to hello() function
        let helloFunc = context.objectForKeyedSubscript("hello")
        // execute hello() function with parameter
        let helloValue = helloFunc.callWithArguments(["World!!!"])
        
        // get reference to hola() function
        let holaFunc = context.objectForKeyedSubscript("hola")
        // execute hola() function with parameter
        let holaValue = holaFunc.callWithArguments(["Bobby"])
        
        println(helloValue) // print "Hello World!!!"
        println(holaValue)  // print "Hola Bobby Cómo estás?"
        
        */
        
        //Evaluate the app code
        evaluateJavaScript(context, jsCode: self.codeBlock.text)
    }
    
    /*
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    */
    
    
    /*
    convenience init( myString: String  ) {
    
    //initialize variables here
    //self.myString = myString
    
    self.init()
    
    // ... store or user your objectId
    }
    
    init ()
    {
    super.init(coder:nil);
    }
    
    required init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
    }
    */
    
    // Initialize

    /*
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)
    {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
    }
    */
    
    func evaluateJavaScript( jsContext: JSContext, jsCode:String)
    {
        
        //Preload
        
        //global variables
        //jsContext.globalObject.set
        //jsContext["version"] = 1;
        
        //global functions
        //jsContext.evaluateScript("var square = function(x) {return x*x;}");
        
        
        //Evaluate the javascript
        let returnValue:JSValue = jsContext.evaluateScript(jsCode);
        
        //Log the final output
        logger( returnValue.toString() )
        
        //[self logger: [ NSString stringWithFormat:@"JavaScript context return value : %@", value] ];
        
        //set the console out to the bottom of the view
        //CGRect caretRect = [self.textViewJavascriptConsoleOut caretRectForPosition:self.textViewJavascriptConsoleOut.endOfDocument];
        //[self.textViewJavascriptConsoleOut scrollRectToVisible:caretRect animated:YES];
    }
    
    func resetScriptContext()
    {
        println("resetScriptContext");
        //[self preLoadJavaScriptGlobalScopeVariablesAndFunctions];
        //[self preLoadObjectiveCBlockFunctions];
    }
    
    func logger( logString:String)
    {
        self.console.text = "\(self.console.text)" + "\n\(logString)"
        //self.console.
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
