
//
//  DataLoader.swift
//  ExampleTemplate
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

let TWITTER_API_CONSUMER_KEY = Utils.getStringFromInfoBundleForKey("TWITTER_API_CONSUMER_KEY")
let TWITTER_API_CONSUMER_SECRET = Utils.getStringFromInfoBundleForKey("TWITTER_API_CONSUMER_SECRET")
let TWITTER_API_TOKEN = Utils.getStringFromInfoBundleForKey("TWITTER_API_TOKEN")
let TWITTER_API_TOKEN_SECRET = Utils.getStringFromInfoBundleForKey("TWITTER_API_TOKEN_SECRET")

let TWITTER_API_OAUTH1_AUTHENTICATE_URL = "https://api.twitter.com/oauth/authenticate"
let TWITTER_API_OAUTH2_TOKEN_URL = "https://api.twitter.com/oauth2/token"
let TWITTER_API_USER_TIMELINE_URL = "https://api.twitter.com/1.1/statuses/user_timeline.json"

public class DataLoader {
    
    // ----------------------------------------------------------
    // Singleton
    // ----------------------------------------------------------
    
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : DataLoader?
    }
    
    class var instance: DataLoader {
    dispatch_once(&Static.token) {  Static.instance = DataLoader() }
        return Static.instance!
    }
    
    init(){
        assert(Static.instance == nil, "Singleton instance already initialized!")
    }
    
    // ----------------------------------------------------------
    // ----------------------------------------------------------
    
    //this is blocking :(
    func LoadImageFromURL(imageURL:String) -> UIImage
    {
        Logger.instance.print("LoadImageFromURL \(imageURL)")
        var url = NSURL.URLWithString(imageURL)
        var data = NSData( contentsOfURL: url)
        var image = UIImage( data: data! )
        //println( " image size \(image.size)")
        return image;
    }
    
    
    func GetFromURL( dataURL:String)
    {
        Logger.instance.print("GetFromURL \(dataURL)")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: dataURL)!, completionHandler: {(data, response, error) in
            
            //expectation.fulfill()
            
            if let HTTPResponse = response as NSHTTPURLResponse! {
                //XCTAssertEqual(HTTPResponse.URL.absoluteString, URL, "HTTP response URL should be equal to original URL")
                //XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                //XCTAssertEqual(HTTPResponse.MIMEType as String, "text/html", "HTTP response content type should be text/html")
            } else {
                // XCTFail("Response was not NSHTTPURLResponse")
            }
        })//end GetFromURL
        
    }//end GetFromURL
    
    func LoginUser( )
    {
        
    }
    
    /*
    // Reference ... Hacktoolkit (@hacktoolkit) and Jonathan Tsai (@jontsai)
    func getTimelineForUsername(username: String, callback: ([Tweet]) -> Void) {
        // For documenation see: https://dev.twitter.com/rest/reference/get/statuses/user_timeline
        var parameters = [
            "screen_name" : username,
        ]
        
        self.GET(
            TWITTER_API_USER_TIMELINE_URL,
            parameters: parameters,
            success: { (request: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                var tweetDictionaries = response as [NSDictionary]
                var tweets = tweetDictionaries.map {
                    (tweetDictionary: NSDictionary) -> Tweet in
                    Tweet(tweetDictionary: tweetDictionary)
                }
                callback(tweets)
            },
            failure: {
                (request: AFHTTPRequestOperation!, error: NSError!) -> Void in
                HTKNotificationUtils.displayNetworkErrorMessage()
            }
        )
    }
    */
    
    // http://darrarski.pl/2014/06/swiftyjson-better-way-deal-json-data-swift/
    
    func MapJSONToObject( ) -> BaseModel
    {
        var model:BaseModel = BaseModel()
        
        /*
        let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(dataFromTwitter, options: NSJSONReadingOptions.MutableContainers, error: nil)
        if let userName = (((jsonObject as? NSArray)?[0] as? NSDictionary)?["user"] as? NSDictionary)?["name"]{
            //What A disaster above
        }
        
        
        
        let json = JSONValue(dataFromNetworking)
        if let userName = json[0]["user"]["name"].string{
            //Now you got your value
        }
        */
        
        return model
    }
    
}