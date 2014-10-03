//
//  FabcasaTests.swift
//  FabcasaTests
//
//  Created by Matthew Schmulen on 10/1/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import XCTest

class FabcasaTests: XCTestCase {
    
    var ArrayNumbers : Array<Int>!
    
    override func setUp() {
        super.setUp()
        ArrayNumbers = [8, 2, 10, 9, 7, 5]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testAddNode() {
        var linkedList: LinkedList<Int> = LinkedList<Int>()
        
        for number in ArrayNumbers {
            linkedList.appendNode(number)
        }
        linkedList.printAllNodes()
        if (linkedList.count != ArrayNumbers.count) {
            XCTFail("linked list count doesn't match number list..")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
