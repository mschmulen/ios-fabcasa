//
//  testing_swiftTests.swift
//  testing-swiftTests
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import XCTest

class testing_swiftTests: XCTestCase {
    
    var calendar: NSCalendar?;
    var locale: NSLocale?;
    
    override func setUp() {
        super.setUp()
        
        self.calendar = NSCalendar(identifier:NSGregorianCalendar)
        self.locale = NSLocale(localeIdentifier:"en-US")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Unit Testing
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func testOnePlusOneEqualsTwo() {
        XCTAssertEqual( 1+1, 2, "one plus one should equal two")
        
        // Fundamental Test
        // XCTAssert(expression, format...)
        // If the expression evaluates to true, the test passes. Otherwise, the test fails, printing the formatted message.
        
        // Boolean Tests
        // XCTAssertTrue(expression, format...)
        // XCTAssertFalse(expression, format...)
        
        // Equality Tests
        // XCTAssertEqual(expression1, expression2, format...)
        // XCTAssertNotEqual(expression1, expression2, format...)
        // XCTAssertEqualWithAccuracy(expression1, expression2, accuracy, format...)
        // XCTAssertNotEqualWithAccuracy(expression1, expression2, accuracy, format...)
        
        
        // Nil Tests
        // XCTAssertNil(expression, format...)
        // XCTAssertNotNil(expression, format...)
        
        // Unconditional Failure
        // XCTFail(format...)
        //
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Performance Testing
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func testDateFormatterPerformance() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LogStyle
        dateFormatter.timeStyle = .ShortStyle
        
        let date = NSDate()
        
        self.measureBlock()
        {
            let string = dateFormatter.stringFromData( date )
        }
        
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

    // XCTestExpectation
    //  Xcode 6 is built-in support for asynchronous testing, with the XCTestExpectation class. Now, tests can wait for a specified length of time for certain conditions to be satisfied, without resorting to complicated GCD incantations
    
    
    // To make a test asynchronous, first create an expectation with expectationWithDescription:
    
    func testAsynch()
    {
        let expectation = expectationWithDescription("...")
        
        //Then, at the bottom of the method, add the waitForExpectationsWithTimeout method, specifying a timeout, and handler to execute if the conditions of a test are not satisfied within that timeframe:
        
        waitForExpectationsWithTimeout( 10, handler: {
            error in
            println(" expectation callback  \(error)    " )
            
        })
        
        //Now, the only remaining step is to fulfill that expecation in the relevant callback of the asynchronous method being tested:
        
        expectation.fulfill()
        
        //If the test has more than one expectation, it will not pass unless each expectation executes fulfill() within the timeout specified in waitForExpectationsWithTimeout().
        
    }
    
    func testAsynchronousURLConnection() {
        
        let URL = "http://nshipster.com/"
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
    }
    
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Mocking
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    // Mocking is a useful technique for isolating and controlling behavior in systems that, for reasons of complexity, non-determinism, or performance constraints, do not usually lend themselves to testing. Examples include simulating network requests, intensive database queries, or inducing states that might emerge under a particular race condition.
    
    // There are a couple of open source libraries for creating mock objects http://nshipster.com/unit-testing/#open-source-libraries and stubbing http://en.wikipedia.org/wiki/Test_stub method calls, but these libraries largely rely on Objective-C runtime manipulation, something that is not currently possible with Swift.
    
    // However, this may not actually be necessary in Swift, due to its less-constrained syntax.
    
    //In Swift, classes can be declared within the definition of a function, allowing for mock objects to be extremely self-contained. Just declare a mock inner-class, override and necessary methods:
    
    func testFetchRequestWithMockedManagedObjectContext() {
        class MockNSManagedObjectContext: NSManagedObjectContext {
            override func executeFetchRequest(request: NSFetchRequest!, error: AutoreleasingUnsafePointer<NSError?>) -> [AnyObject]! {
                return [["name": "Johnny Appleseed", "email": "johnny@apple.com"]]
            }
        }
        
        let mockContext = MockNSManagedObjectContext()
        let fetchRequest = NSFetchRequest(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email ENDSWITH[cd] %@", "@apple.com")
        fetchRequest.resultType = .DictionaryResultType
        
        var error: NSError?
        let results = mockContext.executeFetchRequest(fetchRequest, error: &error)
        
        XCTAssertNil(error, "error should be nil")
        XCTAssertEqual(results.count, 1, "fetch request should only return 1 result")
        
        let result = results[0] as [String: String]
        XCTAssertEqual(result["name"] as String, "Johnny Appleseed", "name should be Johnny Appleseed")
        XCTAssertEqual(result["email"] as String, "johnny@apple.com", "email should be johnny@apple.com")
    }
    
    // If you're new to testing on iOS or OS X, start by adding a few assertions to that automatically-generated test case file and hitting ⌘ + U. You might be surprised at how easy and—dare I say—enjoyable you'll find the whole experience.
    
}
