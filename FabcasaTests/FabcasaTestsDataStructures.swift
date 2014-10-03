//
//  FabcasaTestsDataStructures.swift
//  Fabcasa
//
//  Created by Matthew Schmulen on 10/2/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import XCTest

class FabcasaTestsDataStructures: XCTestCase {
    
    //establish the test numbers
    var ArrayNumbers : Array<Int>!
    
    override func setUp() {
        super.setUp()
        ArrayNumbers = [8, 2, 10, 9, 7, 5]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testLinkedList() {
        var linkedList: LinkedList<Int> = LinkedList<Int>()
        
        for number in ArrayNumbers {
            linkedList.appendNode(number)
        }
        linkedList.printAllNodes()
        
        if (linkedList.count != ArrayNumbers.count) {
            XCTFail("linked list count doesn't match number list..")
        }
        
        linkedList.addNodeAtIndex(4, index: 3)
        linkedList.printAllNodes()
        
        if (linkedList.count != ArrayNumbers.count + 1) {
            XCTFail("linked list addition at index failed..")
        }
        
        linkedList.removeNodeAtIndex(1)
        linkedList.printAllNodes()
        
        if (linkedList.count != ArrayNumbers.count) {
            XCTFail("linked list count doesn't match number list..")
        }
        
    } //end function
    
    func testExample() {
        testAddNode()
        testLinkedList()
        
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            //testAddLink()
            //testLinkedList()
        }
    }
    
}
