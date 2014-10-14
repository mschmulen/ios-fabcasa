//
//  FabAppTests.swift
//  FabAppTests
//
//  Created by Matt Schmulen on 10/6/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit
import XCTest

class FabAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Unit Testing
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Performance Testing
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func testDateFormatterPerformance() {
        
        /*
        let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .ShortStyle
        
        let date = NSDate()
        
        self.measureBlock()
            {
                let string = dateFormatter.stringFromData( date )
        }
        */
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Asynchronous testing
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func testAsynchDataLoader() {
        
        /*
        let URL = "http://woot.com/"
        let expectation = expectationWithDescription("GET \(URL)")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: URL), completionHandler: {(data, response, error) in
            expectation.fulfill()
            
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as NSHTTPURLResponse! {
                XCTAssertEqual(HTTPResponse.URL.absoluteString, URL, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(HTTPResponse.MIMEType as String, "text/html", "HTTP response content type should be text/html")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
        })
        
        task.resume()
        
        waitForExpectationsWithTimeout(task.originalRequest.timeoutInterval, handler: { error in
            task.cancel()
        })
        */
    }
    
    func testAsynchImageLoader() {
        
        /*
        let URL = "http://woot.com/"
        let expectation = expectationWithDescription("GET \(URL)")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: URL), completionHandler: {(data, response, error) in
            expectation.fulfill()
            
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as NSHTTPURLResponse! {
                XCTAssertEqual(HTTPResponse.URL.absoluteString, URL, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(HTTPResponse.MIMEType as String, "text/html", "HTTP response content type should be text/html")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
        })
        
        task.resume()
        
        waitForExpectationsWithTimeout(task.originalRequest.timeoutInterval, handler: { error in
        task.cancel()
        })
        */
        
    }

    
}
