// Playground - noun: a place where people can play

import UIKit


func Fileio( fileName:String ) {
    
    let dirs : [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
    
    if ((dirs) != nil) {
        let dir = dirs![0]; //documents directory
        let path = dir.stringByAppendingPathComponent(fileName);
        let text = "some text"
        
        //writing
        text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
        
        //reading
        let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
    }
}

func simpleRead()
{
    let bundle = NSBundle.mainBundle()
    let path = bundle.pathForResource("data", ofType: "txt")
    //let content = NSString.stringWithContentsOfFile(path) as String
    //println(content) // prints the content of data.txt
}











